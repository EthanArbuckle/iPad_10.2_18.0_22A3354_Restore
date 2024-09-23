@implementation PARMoreResultsRequest

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PARMoreResultsRequest;
  v4 = a3;
  -[PARRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_moreResultsURL, CFSTR("moreResults"), v5.receiver, v5.super_class);

}

- (PARMoreResultsRequest)initWithCoder:(id)a3
{
  id v4;
  PARMoreResultsRequest *v5;
  uint64_t v6;
  NSURL *moreResultsURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PARMoreResultsRequest;
  v5 = -[PARRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("moreResults"));
    v6 = objc_claimAutoreleasedReturnValue();
    moreResultsURL = v5->_moreResultsURL;
    v5->_moreResultsURL = (NSURL *)v6;

  }
  return v5;
}

- (unsigned)nwActivityLabel
{
  return 7;
}

- (NSURL)moreResultsURL
{
  return self->_moreResultsURL;
}

- (void)setMoreResultsURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreResultsURL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
