@implementation DIExecutionFeedback

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend(v5, "encodeBool:forKey:", self->_consumed, CFSTR("consumed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_finishDate, CFSTR("finishDate"));

  os_unfair_lock_unlock(p_lock);
}

- (DIExecutionFeedback)initWithCoder:(id)a3
{
  id v4;
  DIExecutionFeedback *v5;
  uint64_t v6;
  NSDate *finishDate;

  v4 = a3;
  v5 = -[DIExecutionFeedback init](self, "init");
  if (v5)
  {
    v5->_consumed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("consumed"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("finishDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    finishDate = v5->_finishDate;
    v5->_finishDate = (NSDate *)v6;

  }
  return v5;
}

- (DIExecutionFeedback)init
{
  DIExecutionFeedback *v2;
  DIExecutionFeedback *v3;
  uint64_t v4;
  NSDate *finishDate;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DIExecutionFeedback;
  v2 = -[DIExecutionFeedback init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_consumed = 1;
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v4 = objc_claimAutoreleasedReturnValue();
    finishDate = v3->_finishDate;
    v3->_finishDate = (NSDate *)v4;

  }
  return v3;
}

- (BOOL)consumed
{
  DIExecutionFeedback *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_consumed;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setConsumed:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_consumed = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSDate)finishDate
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_finishDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setFinishDate:(id)a3
{
  NSDate *v4;
  NSDate *finishDate;
  NSDate *v6;

  v6 = (NSDate *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_finishDate != v6)
  {
    v4 = (NSDate *)-[NSDate copyWithZone:](v6, "copyWithZone:", 0);
    finishDate = self->_finishDate;
    self->_finishDate = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", &stru_24C2D5A40);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)DIExecutionFeedback;
  -[DIExecutionFeedback description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v4);

  os_unfair_lock_lock(&self->_lock);
  if (self->_consumed)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("consumed: '%@'; "), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("finishDate: '%@';"), self->_finishDate);
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishDate, 0);
}

@end
