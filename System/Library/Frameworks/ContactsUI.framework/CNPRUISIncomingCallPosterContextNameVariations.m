@implementation CNPRUISIncomingCallPosterContextNameVariations

- (CNPRUISIncomingCallPosterContextNameVariations)initWithShortName:(id)a3 fullName:(id)a4
{
  id v6;
  id v7;
  CNPRUISIncomingCallPosterContextNameVariations *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PRUISIncomingCallPosterContextNameVariations *wrappedNameVariations;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CNPRUISIncomingCallPosterContextNameVariations;
  v8 = -[CNPRUISIncomingCallPosterContextNameVariations init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v6)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, &unk_1E20D3150);
    if (v7)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, &unk_1E20D3168);
    v11 = objc_msgSend(objc_alloc((Class)getPRUISIncomingCallPosterContextNameVariationsClass[0]()), "initWithNamesDictionary:", v10);
    wrappedNameVariations = v8->_wrappedNameVariations;
    v8->_wrappedNameVariations = (PRUISIncomingCallPosterContextNameVariations *)v11;

  }
  return v8;
}

- (PRUISIncomingCallPosterContextNameVariations)wrappedNameVariations
{
  return self->_wrappedNameVariations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedNameVariations, 0);
}

@end
