@implementation NLPOIEntry

- (NLPOIEntry)initWithProtoBuf:(id)a3
{
  NLPOIEntry *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NLPOIEntry;
  v4 = -[NLPOIEntry init](&v6, sel_init);
  if (v4)
    v4->m_impl = (NLPOIEntryImpl *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NLPOIEntry;
  -[NLPOIEntry dealloc](&v3, sel_dealloc);
}

- (NSString)name
{
  return -[NLPOIEntryImpl name](self->m_impl, "name");
}

- (unsigned)category
{
  if (-[NSString isEqualToString:](-[NLPOIEntryImpl category](self->m_impl, "category"), "isEqualToString:", CFSTR("active")))
  {
    return 1;
  }
  if (-[NSString isEqualToString:](-[NLPOIEntryImpl category](self->m_impl, "category"), "isEqualToString:", CFSTR("arts")))
  {
    return 2;
  }
  if (-[NSString isEqualToString:](-[NLPOIEntryImpl category](self->m_impl, "category"), "isEqualToString:", CFSTR("education")))
  {
    return 3;
  }
  return 0;
}

- (float)score
{
  float result;

  -[NLPOIEntryImpl score](self->m_impl, "score");
  return result;
}

@end
