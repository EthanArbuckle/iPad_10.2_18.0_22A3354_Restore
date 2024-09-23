@implementation AARegionInfo

- (AARegionInfo)init
{
  -[AARegionInfo doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (AARegionInfo)initWithDictionary:(id)a3
{
  id v4;
  AARegionInfo *v5;
  uint64_t v6;
  NSDictionary *regionInfoDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AARegionInfo;
  v5 = -[AARegionInfo init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    regionInfoDictionary = v5->_regionInfoDictionary;
    v5->_regionInfoDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithDictionary:", self->_regionInfoDictionary);
}

- (NSString)displayedHostname
{
  return (NSString *)-[NSDictionary objectForKey:](self->_regionInfoDictionary, "objectForKey:", CFSTR("displayedHostname"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionInfoDictionary, 0);
}

@end
