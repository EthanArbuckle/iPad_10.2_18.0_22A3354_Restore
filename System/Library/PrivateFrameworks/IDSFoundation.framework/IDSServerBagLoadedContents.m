@implementation IDSServerBagLoadedContents

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (IDSServerBagLoadedContents)initWithDictionary:(id)a3 rawContents:(id)a4
{
  id v7;
  id v8;
  void *v9;
  IDSServerBagLoadedContents *v10;
  IDSServerBagLoadedContents *v11;
  id *p_isa;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v14.receiver = self;
    v14.super_class = (Class)IDSServerBagLoadedContents;
    v11 = -[IDSServerBagLoadedContents init](&v14, sel_init);
    p_isa = (id *)&v11->super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_dictionary, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v10 = self;
  }

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  const char *v9;
  double v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v8 = objc_msgSend_count(self->_dictionary, v5, v6, v7);
  return (id)objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("<%@:%p; dictionary.count: %llu; rawContents: %@"),
               v10,
               v4,
               self,
               v8,
               self->_rawContents);
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  const char *v5;
  double v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("<%@:%p; dictionary: %@; rawContents: %@"),
               v6,
               v4,
               self,
               self->_dictionary,
               self->_rawContents);
}

- (IDSServerBagRawContents)rawContents
{
  return self->_rawContents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawContents, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
