@implementation ATXHeuristicActionMaker

- (id)action
{
  void *v3;
  void *v4;

  -[ATXHeuristicActionMaker _makeAction](self, "_makeAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_criteria)
    objc_msgSend(v3, "setCriteria:");
  if (self->_heuristic)
    objc_msgSend(v4, "setHeuristic:");
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXHeuristicActionMaker)initWithCoder:(id)a3
{
  id v4;
  ATXHeuristicActionMaker *v5;
  uint64_t v6;
  ATXActionCriteria *criteria;
  uint64_t v8;
  NSString *heuristic;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  NSString *subtitle;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXHeuristicActionMaker;
  v5 = -[ATXHeuristicActionMaker init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("criteria"));
    v6 = objc_claimAutoreleasedReturnValue();
    criteria = v5->_criteria;
    v5->_criteria = (ATXActionCriteria *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("heuristic"));
    v8 = objc_claimAutoreleasedReturnValue();
    heuristic = v5->_heuristic;
    v5->_heuristic = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v10 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v12 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  ATXActionCriteria *criteria;
  id v5;

  criteria = self->_criteria;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", criteria, CFSTR("criteria"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_heuristic, CFSTR("heuristic"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("subtitle"));

}

- (ATXActionCriteria)criteria
{
  return self->_criteria;
}

- (void)setCriteria:(id)a3
{
  objc_storeStrong((id *)&self->_criteria, a3);
}

- (NSString)heuristic
{
  return self->_heuristic;
}

- (void)setHeuristic:(id)a3
{
  objc_storeStrong((id *)&self->_heuristic, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heuristic, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
