@implementation CSSearchableItemAttributeSet

- (void)setTheme:(NSString *)theme
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", theme, CFSTR("kMDItemTheme"));
}

- (void)setSubject:(NSString *)subject
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", subject, CFSTR("kMDItemSubject"));
}

- (void)setIdentifier:(NSString *)identifier
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", identifier, CFSTR("kMDItemIdentifier"));
}

- (void)setContentDescription:(NSString *)contentDescription
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", contentDescription, CFSTR("kMDItemDescription"));
}

- (void)setRankingHint:(NSNumber *)rankingHint
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", rankingHint, CFSTR("kMDItemRankingHint"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingHints, 0);
  objc_storeStrong((id *)&self->_contentDecoder, 0);
  objc_storeStrong((id *)&self->_decoder, 0);
  objc_storeStrong((id *)&self->_customAttributes, 0);
  objc_storeStrong((id *)&self->_mutableAttributes, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

- (id)_getExternalAnalysisTagsForPrimaryAttribute:(id)a3 analysisAttribibutes:(id)a4 getTagBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *, void *, double);
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  id v38;
  void *v39;
  void (**v40)(id, _QWORD, void *, void *, double);
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *, void *, double))a5;
  if (objc_msgSend(v9, "count") != 4)
    -[CSSearchableItemAttributeSet(CSPhotos_Private) _getExternalAnalysisTagsForPrimaryAttribute:analysisAttribibutes:getTagBlock:].cold.1();
  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
    goto LABEL_31;
  }
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet attributeForKey:](self, "attributeForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "count");
  if (!v16)
  {
    v13 = 0;
    goto LABEL_30;
  }
  v17 = v16;
  v38 = v8;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet attributeForKey:](self, "attributeForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v19;
  v41 = objc_msgSend(v19, "count");
  objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet attributeForKey:](self, "attributeForKey:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = objc_msgSend(v21, "count");
  v37 = v9;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet attributeForKey:](self, "attributeForKey:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = objc_msgSend(v23, "count");
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v17);
  v25 = 0;
  v42 = 0;
  v40 = v10;
  do
  {
    objc_msgSend(v15, "objectAtIndexedSubscript:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_21;
    v27 = 0.0;
    if (v25 < v43)
    {
      objc_msgSend(v23, "objectAtIndexedSubscript:", v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v28, "doubleValue");
        v27 = v29;
      }

    }
    if (v25 < v44)
    {
      objc_msgSend(v21, "objectAtIndexedSubscript:", v25);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = objc_msgSend(v30, "unsignedIntegerValue");

        if (v31)
        {
          if (v31 + v42 <= v41)
          {
            objc_msgSend(v39, "subarrayWithRange:");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v32 = 0;
          }
          v42 += v31;
          v10 = v40;
          goto LABEL_18;
        }
      }
      else
      {

      }
    }
    v32 = 0;
LABEL_18:
    v10[2](v10, v25, v26, v32, v27);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
      objc_msgSend(v24, "addObject:", v33);

LABEL_21:
    ++v25;
  }
  while (v17 != v25);
  if (objc_msgSend(v24, "count"))
    v34 = v24;
  else
    v34 = 0;
  v35 = v23;
  v13 = v34;

  v9 = v37;
  v8 = v38;
  v12 = 0;
LABEL_30:

LABEL_31:
  return v13;
}

- (id)_getNonNullValueForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  CSDecoder *decoder;
  void *v9;
  __int128 v11;
  $37FF168C8709F524D812460C59637AB1 reference;
  __int128 v13;
  $37FF168C8709F524D812460C59637AB1 v14;
  _BYTE v15[4096];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mutableAttributes, "objectForKeyedSubscript:", v4);
  v6 = (void *)*MEMORY[0x1E0C9B0D0];
  if (v5 == (id)*MEMORY[0x1E0C9B0D0])
  {
    v7 = 0;
    goto LABEL_15;
  }
  if (!v5)
  {
    if (self->_decoder)
    {
      bzero(v15, 0x1000uLL);
      if (objc_msgSend(v4, "getCString:maxLength:encoding:", v15, 4096, 4)
        && (v13 = 0uLL,
            v14 = 0,
            v11 = *(_OWORD *)&self->_codedAttributes.containerBytes,
            reference = self->_codedAttributes.reference,
            _MDPlistDictionaryGetPlistObjectForKey()))
      {
        decoder = self->_decoder;
        v11 = v13;
        reference = v14;
        -[CSDecoder decodeObject:](decoder, "decodeObject:", &v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
      if (v9 == v6)
      {
        v7 = 0;
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      v9 = 0;
    }
    v7 = v9;
    v6 = v7;
    goto LABEL_14;
  }
  v7 = v5;
LABEL_15:

  return v7;
}

- (id)attributeForKey:(id)a3
{
  id v4;
  void *v5;
  CSDecoder *decoder;
  __int128 *v7;
  CSDecoder *v8;
  int v9;
  id v10;
  void *v11;
  char v13;
  __int128 v14;
  $37FF168C8709F524D812460C59637AB1 reference;
  __int128 v16;
  $37FF168C8709F524D812460C59637AB1 v17;
  void *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_mutableAttributes, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_customAttributes, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if (self->_decoder)
      {
        bzero(buf, 0x1000uLL);
        if ((objc_msgSend(v4, "getCString:maxLength:encoding:", buf, 4096, 4) & 1) != 0)
        {
          v16 = 0uLL;
          v17 = 0;
          v14 = *(_OWORD *)&self->_codedAttributes.containerBytes;
          reference = self->_codedAttributes.reference;
          if (_MDPlistDictionaryGetPlistObjectForKey())
          {
            decoder = self->_decoder;
            v14 = v16;
            reference = v17;
            v7 = &v14;
            goto LABEL_7;
          }
          if (self->_hasCodedCustomAttributes)
          {
            v14 = *(_OWORD *)&self->_codedCustomAttributes.containerBytes;
            reference = self->_codedCustomAttributes.reference;
            if (_MDPlistDictionaryGetPlistObjectForKey())
            {
              v14 = v16;
              reference = v17;
              if (_MDPlistGetPlistObjectType() == 240)
              {
                v14 = v16;
                reference = v17;
                if (_MDPlistArrayGetCount() == 2)
                {
                  v8 = self->_decoder;
                  v14 = v16;
                  reference = v17;
                  _MDPlistArrayGetPlistObjectAtIndex();
                  v7 = (__int128 *)&v13;
                  decoder = v8;
LABEL_7:
                  -[CSDecoder decodeObject:](decoder, "decodeObject:", v7);
                  v5 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v5)
                    goto LABEL_15;
                }
              }
            }
          }
        }
      }
      -[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_15:
  if (v5 == (void *)*MEMORY[0x1E0C9B0D0])
  {
    v11 = 0;
  }
  else
  {
    v9 = objc_msgSend(v4, "isEqual:", CFSTR("_kMDItemUserTags"));
    if (v5 && v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v20 = v4;
        v21 = 2112;
        v22 = v5;
        _os_log_impl(&dword_18C42F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Bad field %@ %@", buf, 0x16u);
      }
      v18 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = v5;
    }
    v11 = v10;
  }

  return v11;
}

- (NSArray)primaryRecipients
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPrimaryRecipientPersons"));
}

- (NSArray)hiddenAdditionalRecipients
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemHiddenAdditionalRecipientPersons"));
}

- (NSArray)additionalRecipients
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAdditionalRecipientPersons"));
}

- (NSArray)photosPeople
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosPeople"));
}

- (CSPerson)photosContributor
{
  return (CSPerson *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosContributor"));
}

- (NSArray)recipientEmailAddresses
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemRecipientEmailAddresses"));
}

- (NSArray)emailAddresses
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEmailAddresses"));
}

- (NSArray)authors
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAuthorPersons"));
}

- (NSArray)recipientNames
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemRecipients"));
}

- (NSArray)authorNames
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAuthors"));
}

- (NSString)fileProviderDomainIdentifier
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("FPDomainIdentifier"));
}

- (CSSearchableItemAttributeSet)initWithItemContentType:(NSString *)itemContentType
{
  NSString *v4;
  NSString *v5;
  void *v6;
  CSSearchableItemAttributeSet *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = itemContentType;
  v5 = v4;
  if (v4)
  {
    v9 = CFSTR("kMDItemContentType");
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CSSearchableItemAttributeSet initWithAttributes:](self, "initWithAttributes:", v6);

  }
  else
  {
    v7 = -[CSSearchableItemAttributeSet initWithAttributes:](self, "initWithAttributes:", 0);
  }

  return v7;
}

- (CSSearchableItemAttributeSet)initWithAttributes:(id)a3
{
  id v5;
  CSSearchableItemAttributeSet *v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableDictionary *mutableAttributes;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSSearchableItemAttributeSet;
  v6 = -[CSSearchableItemAttributeSet init](&v11, sel_init);
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = 24;
    }
    else
    {
      v8 = objc_msgSend(v5, "mutableCopy");
      mutableAttributes = v6->_mutableAttributes;
      v6->_mutableAttributes = (NSMutableDictionary *)v8;

      v7 = 16;
    }
    objc_storeStrong((id *)((char *)&v6->super.isa + v7), a3);
  }

  return v6;
}

- (void)_setNumberValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v7, objc_opt_class(), v6, 0);

}

- (CSSearchableItemAttributeSet)initWithAttributeSet:(id)a3
{
  id *v4;
  CSSearchableItemAttributeSet *v5;
  CSSearchableItemAttributeSet *v6;
  uint64_t v7;
  NSMutableDictionary *mutableAttributes;
  uint64_t v9;
  NSMutableDictionary *customAttributes;
  uint64_t v11;
  CSDecoder *decoder;
  __int128 v14;
  $37FF168C8709F524D812460C59637AB1 v15;
  objc_super v16;

  v4 = (id *)a3;
  v16.receiver = self;
  v16.super_class = (Class)CSSearchableItemAttributeSet;
  v5 = -[CSSearchableItemAttributeSet init](&v16, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v5->_searchableItemFlags = objc_msgSend(v4, "searchableItemFlags");
    v7 = objc_msgSend(v4[3], "mutableCopy");
    mutableAttributes = v6->_mutableAttributes;
    v6->_mutableAttributes = (NSMutableDictionary *)v7;

    v9 = objc_msgSend(v4[4], "mutableCopy");
    customAttributes = v6->_customAttributes;
    v6->_customAttributes = (NSMutableDictionary *)v9;

    objc_msgSend(v4, "decoder");
    v11 = objc_claimAutoreleasedReturnValue();
    decoder = v6->_decoder;
    v6->_decoder = (CSDecoder *)v11;

    objc_msgSend(v4, "codedAttributes");
    *(_OWORD *)&v6->_codedAttributes.containerBytes = v14;
    v6->_codedAttributes.reference = v15;
    objc_msgSend(v4, "codedCustomAttributes");
    *(_OWORD *)&v6->_codedCustomAttributes.containerBytes = v14;
    v6->_codedCustomAttributes.reference = v15;
    v6->_hasCodedCustomAttributes = objc_msgSend(v4, "hasCodedCustomAttributes");
  }

  return v6;
}

- (CSDecoder)decoder
{
  return self->_decoder;
}

- ($781B0FC3B6CF89EDF0F49E4213B771BC)codedAttributes
{
  *($70FB98EE0919CC727AB8FBF44F6186F7 *)retstr = ($70FB98EE0919CC727AB8FBF44F6186F7)self[3];
  return self;
}

- (BOOL)hasCodedCustomAttributes
{
  return self->_hasCodedCustomAttributes;
}

- ($781B0FC3B6CF89EDF0F49E4213B771BC)codedCustomAttributes
{
  *($70FB98EE0919CC727AB8FBF44F6186F7 *)retstr = ($70FB98EE0919CC727AB8FBF44F6186F7)self[4];
  return self;
}

- (CSSearchableItemAttributeSet)initWithKnownKeysDictionary:(id)a3
{
  CSSearchableItemAttributeSet *result;

  result = -[CSSearchableItemAttributeSet initWithMutableDictionary:](self, "initWithMutableDictionary:", a3);
  if (result)
    result->_hasKnownKeysDictionary = 1;
  return result;
}

- (CSSearchableItemAttributeSet)initWithMutableDictionary:(id)a3
{
  id v5;
  CSSearchableItemAttributeSet *v6;
  CSSearchableItemAttributeSet *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSSearchableItemAttributeSet;
  v6 = -[CSSearchableItemAttributeSet init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mutableAttributes, a3);

  return v7;
}

- (int64_t)searchableItemFlags
{
  return self->_searchableItemFlags;
}

- (NSString)uniqueIdentifier
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemExternalID"));
}

- (NSData)HTMLContentData
{
  void *v3;
  CSDecoder *contentDecoder;
  __int128 v6;
  $37FF168C8709F524D812460C59637AB1 reference;

  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemHTMLContentData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (self->_contentDecoder
      && (v6 = *(_OWORD *)&self->_contentObj.containerBytes,
          reference = self->_contentObj.reference,
          _MDPlistGetPlistObjectType() == 246))
    {
      contentDecoder = self->_contentDecoder;
      v6 = *(_OWORD *)&self->_contentObj.containerBytes;
      reference = self->_contentObj.reference;
      -[CSDecoder decodeObject:](contentDecoder, "decodeObject:", &v6);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  return (NSData *)v3;
}

- (NSString)textContent
{
  void *v3;
  $70FB98EE0919CC727AB8FBF44F6186F7 *p_contentObj;
  CSDecoder *contentDecoder;
  __int128 v7;
  $37FF168C8709F524D812460C59637AB1 reference;

  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemTextContent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (self->_contentDecoder
      && ((p_contentObj = &self->_contentObj,
           v7 = *(_OWORD *)&self->_contentObj.containerBytes,
           reference = self->_contentObj.reference,
           _MDPlistGetPlistObjectType() == 244)
       || (v7 = *(_OWORD *)&p_contentObj->containerBytes,
           reference = self->_contentObj.reference,
           _MDPlistGetPlistObjectType() == 245)))
    {
      contentDecoder = self->_contentDecoder;
      v7 = *(_OWORD *)&p_contentObj->containerBytes;
      reference = self->_contentObj.reference;
      -[CSDecoder decodeObject:](contentDecoder, "decodeObject:", &v7);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  return (NSString *)v3;
}

- (void)_setArrayValue:(id)a3 withItemClass:(Class)a4 forKey:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (!v7)
    goto LABEL_21;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = v7;
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v20;
      while (2)
      {
        v13 = 0;
        v14 = v11 + v10;
        do
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v7);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            logForCSLogCategoryDefault();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              v17 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412802;
              v24 = v17;
              v25 = 2048;
              v26 = v11 + v13;
              v27 = 2112;
              v28 = v8;
              v18 = v17;
              _os_log_error_impl(&dword_18C42F000, v16, OS_LOG_TYPE_ERROR, "Invalid value type:%@ for the item at index %lu in the array value for key:%@", buf, 0x20u);

            }
            goto LABEL_22;
          }
          ++v13;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
        v11 = v14;
        if (v10)
          continue;
        break;
      }

      if (v14)
        goto LABEL_21;
    }
    else
    {

    }
    v7 = 0;
LABEL_21:
    -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v7, 0, v8, 1, v19);
    goto LABEL_22;
  }
  logForCSLogCategoryDefault();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:].cold.1();

LABEL_22:
}

- (void)_setStringValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v7, objc_opt_class(), v6, 1);

}

- (void)_setValue:(id)a3 withClass:(Class)a4 forKey:(id)a5 copy:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *mutableAttributes;
  void *v14;
  void *v15;
  uint64_t v16;
  NSDictionary *attributes;
  NSObject *v18;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  if (self->_hasKnownKeysDictionary && self->_mutableAttributes)
  {
    v12 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", self->_mutableAttributes);
    mutableAttributes = self->_mutableAttributes;
    self->_mutableAttributes = v12;

    self->_hasKnownKeysDictionary = 0;
  }
  if (!v10)
  {
    v16 = *MEMORY[0x1E0C9B0D0];
    -[CSSearchableItemAttributeSet mutableAttributes](self, "mutableAttributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, v11);
LABEL_12:

LABEL_13:
    attributes = self->_attributes;
    self->_attributes = 0;

    goto LABEL_14;
  }
  if (!a4 || (objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v10;
    if (v6)
      v14 = (void *)objc_msgSend(v10, "copy");
    -[CSSearchableItemAttributeSet mutableAttributes](self, "mutableAttributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v11);

    if (!v6)
      goto LABEL_13;
    goto LABEL_12;
  }
  logForCSLogCategoryDefault();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:].cold.1();

LABEL_14:
}

- (NSMutableDictionary)mutableAttributes
{
  NSMutableDictionary *mutableAttributes;
  CSSearchableItemAttributeSet *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;

  mutableAttributes = self->_mutableAttributes;
  if (!mutableAttributes)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!self->_mutableAttributes)
    {
      v5 = (NSMutableDictionary *)objc_opt_new();
      v6 = self->_mutableAttributes;
      self->_mutableAttributes = v5;

    }
    objc_sync_exit(v4);

    mutableAttributes = self->_mutableAttributes;
  }
  return mutableAttributes;
}

- (void)encodeWithCSCoder:(id)a3 includeText:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  id v8;
  int PlistObjectType;
  __CFString **v10;
  __CFString *v11;
  void *v12;
  _BOOL4 hasCodedCustomAttributes;
  uint64_t v14;
  uint64_t v15;
  id v16;
  __int128 v17;
  $37FF168C8709F524D812460C59637AB1 reference;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t, __int128 *);
  void *v22;
  CSSearchableItemAttributeSet *v23;
  id v24;
  BOOL v25;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "beginType:", "CSSearchableItemAttributeSet");
  objc_msgSend(v6, "encodeInt32:", -[CSSearchableItemAttributeSet searchableItemFlags](self, "searchableItemFlags"));
  if (self->_decoder)
  {
    v7 = -[NSMutableDictionary count](self->_mutableAttributes, "count");
    objc_msgSend(v6, "beginDictionary");
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __80__CSSearchableItemAttributeSet_CSCoderAdditions__encodeWithCSCoder_includeText___block_invoke;
    v22 = &unk_1E2401DF8;
    v25 = v7 != 0;
    v23 = self;
    v8 = v6;
    v24 = v8;
    v17 = *(_OWORD *)&self->_codedAttributes.containerBytes;
    reference = self->_codedAttributes.reference;
    _MDPlistDictionaryIterate();
    if (v4 && self->_contentDecoder)
    {
      v17 = *(_OWORD *)&self->_contentObj.containerBytes;
      reference = self->_contentObj.reference;
      PlistObjectType = _MDPlistGetPlistObjectType();
      if (PlistObjectType == 246)
      {
        v10 = MDItemHTMLContentData;
      }
      else
      {
        if ((PlistObjectType & 0xFFFFFFFE) != 0xF4)
          goto LABEL_13;
        v10 = MDItemTextContent;
      }
      v11 = *v10;
      if (v7)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_mutableAttributes, "objectForKeyedSubscript:", *v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          goto LABEL_14;
      }
      objc_msgSend(v8, "encodeObject:", v11);
      v17 = *(_OWORD *)&self->_contentObj.containerBytes;
      reference = self->_contentObj.reference;
      objc_msgSend(v8, "encodeMDPlistObject:", &v17);
    }
LABEL_13:
    if (!v7)
    {
LABEL_15:
      objc_msgSend(v8, "endDictionary");
      hasCodedCustomAttributes = self->_hasCodedCustomAttributes;
      v14 = -[NSMutableDictionary count](self->_customAttributes, "count");
      v15 = v14;
      if (hasCodedCustomAttributes)
      {
        objc_msgSend(v8, "beginDictionary");
        v16 = v8;
        v17 = *(_OWORD *)&self->_codedAttributes.containerBytes;
        reference = self->_codedAttributes.reference;
        _MDPlistDictionaryIterate();
        if (v15)
          -[NSMutableDictionary encodeKeysAndValuesWithCSCoder:filterBlock:](self->_customAttributes, "encodeKeysAndValuesWithCSCoder:filterBlock:", v16, 0);
        objc_msgSend(v16, "endDictionary");

      }
      else if (v14)
      {
        objc_msgSend(v8, "encodeObject:", self->_customAttributes);
      }

      goto LABEL_22;
    }
LABEL_14:
    -[NSMutableDictionary encodeKeysAndValuesWithCSCoder:filterBlock:](self->_mutableAttributes, "encodeKeysAndValuesWithCSCoder:filterBlock:", v8, 0);
    goto LABEL_15;
  }
  objc_msgSend(v6, "beginDictionary");
  -[NSMutableDictionary encodeKeysAndValuesWithCSCoder:filterBlock:](self->_mutableAttributes, "encodeKeysAndValuesWithCSCoder:filterBlock:", v6, 0);
  objc_msgSend(v6, "endDictionary");
  if (-[NSMutableDictionary count](self->_customAttributes, "count"))
    objc_msgSend(v6, "encodeObject:", self->_customAttributes);
LABEL_22:
  objc_msgSend(v6, "endType");

}

- (void)encodeWithCSCoder:(id)a3
{
  -[CSSearchableItemAttributeSet encodeWithCSCoder:includeText:](self, "encodeWithCSCoder:includeText:", a3, 0);
}

- (CSSearchableItemAttributeSet)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  CSDecoder *v7;
  void *v8;
  void *v9;
  int Count;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)CSSearchableItemAttributeSet;
  v5 = -[CSSearchableItemAttributeSet init](&v39, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("container"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = -[CSDecoder initWithData:]([CSDecoder alloc], "initWithData:", v6);
      v8 = (void *)*((_QWORD *)v5 + 6);
      *((_QWORD *)v5 + 6) = v7;

      v9 = (void *)*((_QWORD *)v5 + 6);
      if (v9
        && (objc_msgSend(v9, "obj"), _MDPlistGetPlistObjectType() == 240)
        && (Count = _MDPlistArrayGetCount(), (Count - 3) <= 1))
      {
        v11 = Count;
        _MDPlistArrayGetPlistObjectAtIndex();
        objc_msgSend(v5, "setSearchableItemFlags:", _MDPlistNumberGetIntValue());
        _MDPlistArrayGetPlistObjectAtIndex();
        *(_OWORD *)(v5 + 72) = 0uLL;
        *((_QWORD *)v5 + 11) = 0;
        if (v11 == 4)
        {
          v5[8] = 1;
          _MDPlistArrayGetPlistObjectAtIndex();
          *((_OWORD *)v5 + 6) = 0uLL;
          *((_QWORD *)v5 + 14) = 0;
        }
      }
      else
      {

        v5 = 0;
      }
    }
    else
    {
      +[CSContactsWrapper sharedInstance](CSContactsWrapper, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v12, "CNContactPropertyClass");

      v38 = (void *)MEMORY[0x1E0C99E60];
      v36 = objc_opt_class();
      v35 = objc_opt_class();
      v34 = objc_opt_class();
      v33 = objc_opt_class();
      v32 = objc_opt_class();
      v31 = objc_opt_class();
      v13 = objc_opt_class();
      v14 = objc_opt_class();
      v15 = objc_opt_class();
      v16 = objc_opt_class();
      v17 = objc_opt_class();
      v18 = objc_opt_class();
      v19 = objc_opt_class();
      objc_msgSend(v38, "setWithObjects:", v36, v35, v34, v33, v32, v31, v13, v14, v15, v16, v37, v17, v18, v19, objc_opt_class(), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("attributes"));
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)*((_QWORD *)v5 + 3);
      *((_QWORD *)v5 + 3) = v21;

      v23 = (void *)MEMORY[0x1E0C99E60];
      v24 = objc_opt_class();
      v25 = objc_opt_class();
      v26 = objc_opt_class();
      objc_msgSend(v23, "setWithObjects:", v24, v25, v26, objc_opt_class(), 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("customAttributes"));
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)*((_QWORD *)v5 + 4);
      *((_QWORD *)v5 + 4) = v28;

    }
  }

  return (CSSearchableItemAttributeSet *)v5;
}

- (void)setSearchableItemFlags:(int64_t)a3
{
  self->_searchableItemFlags = a3;
}

- (void)setAttribute:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSDictionary *attributes;

  v6 = a4;
  v7 = a3;
  -[CSSearchableItemAttributeSet mutableAttributes](self, "mutableAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

  attributes = self->_attributes;
  self->_attributes = 0;

}

- (NSString)userActivityType
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemUserActivityType"));
}

- (void)setApplicationName:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemApplicationName"));
}

- (void)setTitle:(NSString *)title
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", title, CFSTR("kMDItemTitle"));
}

- (void)setDisplayName:(NSString *)displayName
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", displayName, CFSTR("kMDItemDisplayName"));
}

- (void)setContentType:(NSString *)contentType
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", contentType, CFSTR("kMDItemContentType"));
}

- (CSSearchableItemAttributeSet)init
{
  return -[CSSearchableItemAttributeSet initWithAttributes:](self, "initWithAttributes:", 0);
}

- (void)addAttributesFromAttributeSet:(id)a3
{
  id *v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  NSDictionary *attributes;
  _BYTE v15[24];

  v4 = (id *)a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "decoder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "decoder");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "codedAttributes");
      objc_msgSend(v7, "decodeObject:", v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v8, "count"))
      {
        -[CSSearchableItemAttributeSet mutableAttributes](self, "mutableAttributes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addEntriesFromDictionary:", v8);

        v10 = 1;
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
    if (objc_msgSend(v5[3], "count"))
    {
      -[CSSearchableItemAttributeSet mutableAttributes](self, "mutableAttributes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addEntriesFromDictionary:", v5[3]);

      v12 = v5 + 4;
      if (!objc_msgSend(v5[4], "count"))
        goto LABEL_15;
    }
    else
    {
      v12 = v5 + 4;
      if (!objc_msgSend(v5[4], "count"))
      {
        if (!v10)
          goto LABEL_16;
        goto LABEL_15;
      }
    }
    -[CSSearchableItemAttributeSet customAttributes](self, "customAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addEntriesFromDictionary:", *v12);

LABEL_15:
    attributes = self->_attributes;
    self->_attributes = 0;

  }
LABEL_16:

}

- (void)setShortcutAvailability:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("kMDItemShortcutAvailability"));
}

- (void)setUserActivityType:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("_kMDItemUserActivityType"));
}

- (NSNumber)fileSize
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemFileSize"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)subItemCount
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemSubItemCount"));
}

- (NSString)ownerName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemOwnerName"));
}

- (NSString)lastEditorName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemLastEditorName"));
}

- (NSNumber)isUploading
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemIsUploading"));
}

- (NSNumber)isUploaded
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemIsUploaded"));
}

- (NSNumber)isTrashed
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemIsTrashed"));
}

- (NSNumber)isShared
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemIsShared"));
}

- (NSNumber)isDownloading
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemIsDownloading"));
}

- (NSNumber)favoriteRank
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemFavoriteRank"));
}

- (NSDate)lastUsedDate
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemLastUsedDate"));
}

- (NSString)displayName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemDisplayName"));
}

- (NSDate)contentModificationDate
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemContentModificationDate"));
}

- (NSDate)contentCreationDate
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemContentCreationDate"));
}

- (NSNumber)isUserOwned
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUserOwned"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAttributeSet:", self);
}

- (void)setExpirationDate:(id)a3
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", a3, CFSTR("_kMDItemExpirationDate"));
}

- (void)_setDateValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v7, objc_opt_class(), v6, 0);

}

- (void)setUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  if (!v4)
  {
    -[CSSearchableItemAttributeSet uniqueIdentifier](self, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v8 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    v4 = v8;
  }
  v9 = v4;
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", v4, CFSTR("_kMDItemExternalID"));

}

- (void)setDomainIdentifier:(NSString *)domainIdentifier
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", domainIdentifier, CFSTR("_kMDItemDomainIdentifier"));
}

- (NSDate)expirationDate
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemExpirationDate"));
}

- (NSNumber)requiresImport
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemRequiresImport"));
}

- (NSArray)contentTypeTree
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemContentTypeTree"));
}

- (NSString)contentType
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemContentType"));
}

- (NSDictionary)portraitNamedEntities
{
  return (NSDictionary *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemPortraitNamedEntities"));
}

- (NSString)fileProviderID
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemFileProviderID"));
}

- (NSString)FPFilename
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("FPFilename"));
}

- (NSURL)contentURL
{
  void *v2;
  id v3;
  void *v4;

  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemContentURL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
LABEL_7:

  return (NSURL *)v4;
}

- (void)_standardizeMarkAs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;

  -[CSSearchableItemAttributeSet mutableAttributes](self, "mutableAttributes");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet userSharedSentDate](self, "userSharedSentDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CSSearchableItemAttributeSet userSharedSentSender](self, "userSharedSentSender");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSearchableItemAttributeSet userSharedSentSenderHandle](self, "userSharedSentSenderHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSearchableItemAttributeSet userSharedSentTransport](self, "userSharedSentTransport");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSearchableItemAttributeSet userSharedSentRecipient](self, "userSharedSentRecipient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSearchableItemAttributeSet userSharedSentRecipientHandle](self, "userSharedSentRecipientHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, CFSTR("kMDItemUserSharedSentDate"));
    objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, CFSTR("kMDItemUserSharedSentSender"));
    objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, CFSTR("kMDItemUserSharedSentSenderHandle"));
    objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, CFSTR("kMDItemUserSharedSentTransport"));
    objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, CFSTR("kMDItemUserSharedSentRecipient"));
    objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, CFSTR("kMDItemUserSharedSentRecipientHandle"));
    v9 = objc_msgSend(v3, "count");
    if (v9)
    {
      v10 = v9;
      if (v9 == objc_msgSend(v4, "count")
        && v10 == objc_msgSend(v5, "count")
        && v10 == objc_msgSend(v6, "count")
        && v10 == objc_msgSend(v5, "count")
        && v10 == objc_msgSend(v7, "count")
        && v10 == objc_msgSend(v8, "count"))
      {
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v3, CFSTR(":PR::A:kMDItemUserSharedSentDate"));
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v4, CFSTR(":PR::A:kMDItemUserSharedSentSender"));
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v5, CFSTR(":PR::A:kMDItemUserSharedSentSenderHandle"));
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v6, CFSTR(":PR::A:kMDItemUserSharedSentTransport"));
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v7, CFSTR(":PR::A:kMDItemUserSharedSentRecipientHandle"));
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v8, CFSTR(":PR::A:kMDItemUserSharedSentRecipient"));
      }
    }

  }
  -[CSSearchableItemAttributeSet userSharedReceivedDate](self, "userSharedReceivedDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[CSSearchableItemAttributeSet userSharedReceivedSender](self, "userSharedReceivedSender");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSearchableItemAttributeSet userSharedReceivedSenderHandle](self, "userSharedReceivedSenderHandle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSearchableItemAttributeSet userSharedReceivedTransport](self, "userSharedReceivedTransport");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSearchableItemAttributeSet userSharedReceivedRecipient](self, "userSharedReceivedRecipient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSearchableItemAttributeSet userSharedReceivedRecipientHandle](self, "userSharedReceivedRecipientHandle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, CFSTR("kMDItemUserSharedReceivedDate"));
    objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, CFSTR("kMDItemUserSharedReceivedSender"));
    objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, CFSTR("kMDItemUserSharedReceivedSenderHandle"));
    objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, CFSTR("kMDItemUserSharedReceivedTransport"));
    objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, CFSTR("kMDItemUserSharedReceivedRecipient"));
    objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, CFSTR("kMDItemUserSharedReceivedRecipientHandle"));
    v17 = objc_msgSend(v11, "count");
    if (v17)
    {
      v18 = v17;
      if (v17 == objc_msgSend(v12, "count")
        && v18 == objc_msgSend(v13, "count")
        && v18 == objc_msgSend(v14, "count")
        && v18 == objc_msgSend(v13, "count")
        && v18 == objc_msgSend(v15, "count")
        && v18 == objc_msgSend(v16, "count"))
      {
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v11, CFSTR(":PR::A:kMDItemUserSharedReceivedDate"));
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v12, CFSTR(":PR::A:kMDItemUserSharedReceivedSender"));
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v13, CFSTR(":PR::A:kMDItemUserSharedReceivedSenderHandle"));
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v14, CFSTR(":PR::A:kMDItemUserSharedReceivedTransport"));
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v15, CFSTR(":PR::A:kMDItemUserSharedReceivedRecipientHandle"));
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v16, CFSTR(":PR::A:kMDItemUserSharedReceivedRecipient"));
      }
    }

  }
  -[CSSearchableItemAttributeSet userPrintedDate](self, "userPrintedDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[CSSearchableItemAttributeSet userPrintedUserHandle](self, "userPrintedUserHandle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, CFSTR("kMDItemUserPrintedDate"));
    objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, CFSTR("kMDItemUserPrintedUserHandle"));
    v21 = objc_msgSend(v19, "count");
    if (v21 && v21 == objc_msgSend(v20, "count"))
    {
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v19, CFSTR(":PR::A:kMDItemUserPrintedDate"));
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v20, CFSTR(":PR::A:kMDItemUserPrintedUserHandle"));
    }

  }
  -[CSSearchableItemAttributeSet userDownloadedDate](self, "userDownloadedDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[CSSearchableItemAttributeSet userDownloadedUserHandle](self, "userDownloadedUserHandle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, CFSTR("kMDItemUserDownloadedDate"));
    objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, CFSTR("kMDItemUserDownloadedUserHandle"));
    v24 = objc_msgSend(v22, "count");
    if (v24 && v24 == objc_msgSend(v23, "count"))
    {
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v22, CFSTR(":PR::A:kMDItemUserDownloadedDate"));
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v23, CFSTR(":PR::A:kMDItemUserDownloadedUserHandle"));
    }

  }
  -[CSSearchableItemAttributeSet userModifiedDate](self, "userModifiedDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    -[CSSearchableItemAttributeSet userModifiedUserHandle](self, "userModifiedUserHandle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, CFSTR("kMDItemUserModifiedDate"));
    objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, CFSTR("kMDItemUserModifiedUserHandle"));
    v27 = objc_msgSend(v25, "count");
    if (v27 && v27 == objc_msgSend(v26, "count"))
    {
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v25, CFSTR(":PR::A:kMDItemUserModifiedDate"));
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v26, CFSTR(":PR::A:kMDItemUserModifiedUserHandle"));
    }

  }
  -[CSSearchableItemAttributeSet userCreatedDate](self, "userCreatedDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    -[CSSearchableItemAttributeSet userCreatedUserHandle](self, "userCreatedUserHandle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, CFSTR("kMDItemUserCreatedDate"));
    objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, CFSTR("kMDItemUserCreatedUserHandle"));
    v30 = objc_msgSend(v28, "count");
    if (v30 && v30 == objc_msgSend(v29, "count"))
    {
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v28, CFSTR(":PR::A:kMDItemUserCreatedUserHandle"));
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v29, CFSTR(":PR::A:kMDItemUserCreatedUserHandle"));
    }

  }
}

- (id)userSharedSentDate
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUserSharedSentDate"));
}

- (id)userSharedReceivedDate
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUserSharedReceivedDate"));
}

- (id)userPrintedDate
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUserPrintedDate"));
}

- (id)userModifiedDate
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUserModifiedDate"));
}

- (id)userDownloadedDate
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUserDownloadedDate"));
}

- (id)userCreatedDate
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUserCreatedDate"));
}

- (void)setContentTypeTree:(NSArray *)contentTypeTree
{
  NSArray *v4;

  v4 = contentTypeTree;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemContentTypeTree"));

}

- (void)setKeywords:(NSArray *)keywords
{
  NSArray *v4;

  v4 = keywords;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemKeywords"));

}

- (NSArray)documentUnderstandingTopics
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("kMDItemDocumentUnderstandingTopicsLabels");
  v6[1] = CFSTR("kMDItemDocumentUnderstandingTopicsSynonyms");
  v6[2] = CFSTR("kMDItemDocumentUnderstandingTopicsSynonymsCounts");
  v6[3] = CFSTR("kMDItemDocumentUnderstandingTopicsConfidences");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet _getExternalAnalysisTagsForPrimaryAttribute:analysisAttribibutes:getTagBlock:](self, "_getExternalAnalysisTagsForPrimaryAttribute:analysisAttribibutes:getTagBlock:", CFSTR("kMDItemDocumentUnderstandingTopics"), v3, &__block_literal_global_1273);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)photosSceneClassifications
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[4];
  _QWORD v29[6];

  v29[4] = *MEMORY[0x1E0C80C00];
  -[CSSearchableItemAttributeSet attributeForKey:](self, "attributeForKey:", CFSTR("kMDItemPhotosSceneClassificationIdentifiers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[CSSearchableItemAttributeSet attributeForKey:](self, "attributeForKey:", CFSTR("kMDItemPhotosSceneClassificationBoundingBoxes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  -[CSSearchableItemAttributeSet attributeForKey:](self, "attributeForKey:", CFSTR("kMDItemPhotosSceneClassificationTypes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  -[CSSearchableItemAttributeSet attributeForKey:](self, "attributeForKey:", CFSTR("kMDItemPhotosSceneClassificationMediaTypes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  v29[0] = CFSTR("kMDItemPhotosSceneClassificationLabels");
  v29[1] = CFSTR("kMDItemPhotosSceneClassificationSynonyms");
  v29[2] = CFSTR("kMDItemPhotosSceneClassificationSynonymsCounts");
  v29[3] = CFSTR("kMDItemPhotosSceneClassificationConfidences");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __76__CSSearchableItemAttributeSet_CSPhotos_Private__photosSceneClassifications__block_invoke;
  v18[3] = &unk_1E2401D28;
  v24 = v4;
  v12 = v3;
  v19 = v12;
  v25 = v8;
  v13 = v7;
  v20 = v13;
  v26 = v10;
  v14 = v9;
  v27 = v6;
  v21 = v14;
  v23 = v28;
  v15 = v5;
  v22 = v15;
  -[CSSearchableItemAttributeSet _getExternalAnalysisTagsForPrimaryAttribute:analysisAttribibutes:getTagBlock:](self, "_getExternalAnalysisTagsForPrimaryAttribute:analysisAttribibutes:getTagBlock:", CFSTR("kMDItemPhotosSceneClassification"), v11, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v28, 8);
  return (NSArray *)v16;
}

- (NSArray)documentUnderstandingCategories
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("kMDItemDocumentUnderstandingCategoriesLabels");
  v6[1] = CFSTR("kMDItemDocumentUnderstandingCategoriesSynonyms");
  v6[2] = CFSTR("kMDItemDocumentUnderstandingCategoriesSynonymsCounts");
  v6[3] = CFSTR("kMDItemDocumentUnderstandingCategoriesConfidences");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet _getExternalAnalysisTagsForPrimaryAttribute:analysisAttribibutes:getTagBlock:](self, "_getExternalAnalysisTagsForPrimaryAttribute:analysisAttribibutes:getTagBlock:", CFSTR("kMDItemDocumentUnderstandingCategories"), v3, &__block_literal_global_1274);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSDictionary)emailHeaders
{
  return (NSDictionary *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEmailHeadersDictionary"));
}

- (NSString)protectionClass
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemProtectionClass"));
}

- (NSString)bundleID
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemBundleID"));
}

- (NSString)domainIdentifier
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemDomainIdentifier"));
}

- (NSArray)userTags
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUserTags"));
}

- (void)setRelatedUniqueIdentifier:(NSString *)relatedUniqueIdentifier
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", relatedUniqueIdentifier, CFSTR("kMDItemRelatedUniqueIdentifier"));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_opt_new();
  -[CSSearchableItemAttributeSet encodeWithCSCoder:includeText:](self, "encodeWithCSCoder:includeText:", v7, 1);
  objc_msgSend(v7, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("container"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  int64_t searchableItemFlags;
  void *v7;
  void *v8;
  int v9;
  id v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (id *)v4;
    searchableItemFlags = self->_searchableItemFlags;
    if (searchableItemFlags != objc_msgSend(v5, "searchableItemFlags"))
    {
      v11 = 0;
LABEL_22:

      goto LABEL_23;
    }
    -[CSSearchableItemAttributeSet attributes](self, "attributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 != v8 && !objc_msgSend(v7, "isEqualToDictionary:", v8))
    {
      v11 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v9 = *((unsigned __int8 *)v5 + 8);
    v10 = v5[4];
    if (-[NSMutableDictionary count](self->_customAttributes, "count") || self->_hasCodedCustomAttributes)
    {
      if (!v9 && !v10)
      {
        v11 = 0;
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      v12 = objc_msgSend(v10, "count");
      v11 = 0;
      if (v9 || v12)
        goto LABEL_20;
    }
    -[CSSearchableItemAttributeSet customAttributeDictionary](self, "customAttributeDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "customAttributeDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 1;
    if (v13 != v14)
    {
      v15 = objc_msgSend(v13, "count");
      if (v15 != objc_msgSend(v14, "count") && !objc_msgSend(v13, "isEqualToDictionary:", v14))
        v11 = 0;
    }

    goto LABEL_20;
  }
  v11 = 0;
LABEL_23:

  return v11;
}

- (id)customAttributeDictionary
{
  id v3;
  id v4;
  void *v6;
  void *v7;
  __int128 v8;
  $37FF168C8709F524D812460C59637AB1 reference;

  if (self->_hasCodedCustomAttributes)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v8 = *(_OWORD *)&self->_codedCustomAttributes.containerBytes;
    reference = self->_codedCustomAttributes.reference;
    _MDPlistDictionaryIterate();
    if (-[NSMutableDictionary count](self->_customAttributes, "count", v8, reference))
      objc_msgSend(v3, "addEntriesFromDictionary:", self->_customAttributes);
    v4 = v3;

    return v4;
  }
  else
  {
    -[CSSearchableItemAttributeSet customAttributes](self, "customAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    return v7;
  }
}

- (NSMutableDictionary)customAttributes
{
  NSMutableDictionary *customAttributes;
  CSSearchableItemAttributeSet *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;

  customAttributes = self->_customAttributes;
  if (!customAttributes)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!self->_customAttributes)
    {
      v5 = (NSMutableDictionary *)objc_opt_new();
      v6 = self->_customAttributes;
      self->_customAttributes = v5;

    }
    objc_sync_exit(v4);

    customAttributes = self->_customAttributes;
  }
  return customAttributes;
}

- (NSDictionary)attributes
{
  NSDictionary *attributes;
  NSDictionary **p_attributes;
  NSMutableDictionary *mutableAttributes;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  CSDecoder *decoder;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  __int128 v14;
  $37FF168C8709F524D812460C59637AB1 reference;

  p_attributes = &self->_attributes;
  attributes = self->_attributes;
  if (!attributes)
  {
    mutableAttributes = self->_mutableAttributes;
    if (self->_hasKnownKeysDictionary)
      v6 = mutableAttributes;
    else
      v6 = (NSMutableDictionary *)-[NSMutableDictionary copy](mutableAttributes, "copy");
    v7 = v6;
    decoder = self->_decoder;
    if (decoder)
    {
      v14 = *(_OWORD *)&self->_codedAttributes.containerBytes;
      reference = self->_codedAttributes.reference;
      -[CSDecoder decodeObject:](decoder, "decodeObject:", &v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count"))
      {
        if (-[NSMutableDictionary count](v7, "count"))
        {
          v10 = (NSMutableDictionary *)objc_msgSend(v9, "mutableCopy");
          -[NSMutableDictionary addEntriesFromDictionary:](v10, "addEntriesFromDictionary:", v7);
          v11 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v10);

          v7 = v10;
        }
        else
        {
          v11 = v9;
        }

        v7 = v11;
      }

    }
    if (v7)
      v12 = v7;
    else
      v12 = (NSMutableDictionary *)MEMORY[0x1E0C9AA70];
    objc_storeStrong((id *)p_attributes, v12);

    attributes = *p_attributes;
  }
  return attributes;
}

- (void)setSubtitle:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemSubtitle"));
}

void __80__CSSearchableItemAttributeSet_CSCoderAdditions__encodeWithCSCoder_includeText___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  uint64_t v13;

  if (!*(_BYTE *)(a1 + 48)
    || (v8 = *(void **)(*(_QWORD *)(a1 + 32) + 24),
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "objectForKeyedSubscript:", v9),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        !v10))
  {
    objc_msgSend(*(id *)(a1 + 40), "encodeString:length:", a2, a3);
    v11 = *(void **)(a1 + 40);
    v12 = *a4;
    v13 = *((_QWORD *)a4 + 2);
    objc_msgSend(v11, "encodeMDPlistObject:", &v12);
  }
}

- (CSSearchableItemAttributeSet)initWithContentType:(UTType *)contentType
{
  void *v4;
  CSSearchableItemAttributeSet *v5;

  -[UTType identifier](contentType, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CSSearchableItemAttributeSet initWithItemContentType:](self, "initWithItemContentType:", v4);

  return v5;
}

- (void)setUserCreated:(NSNumber *)userCreated
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", userCreated, CFSTR("kMDItemUserCreated"));
}

- (NSNumber)isUserCreated
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUserCreated"));
}

- (void)setUserOwned:(NSNumber *)userOwned
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", userOwned, CFSTR("kMDItemUserOwned"));
}

- (void)setUserCurated:(NSNumber *)userCurated
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", userCurated, CFSTR("kMDItemUserCurated"));
}

- (NSNumber)isUserCurated
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUserCurated"));
}

- (NSNumber)rankingHint
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemRankingHint"));
}

- (CSSearchableItemAttributeSet)initWithSerializedAttributes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  CSSearchableItemAttributeSet *v8;
  uint64_t v9;
  NSMutableDictionary *customAttributes;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCSCustomAttributes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObjectForKey:", CFSTR("kCSCustomAttributes"));
  v8 = -[CSSearchableItemAttributeSet initWithAttributes:]([CSSearchableItemAttributeSet alloc], "initWithAttributes:", v6);

  if (v8)
  {
    v9 = objc_msgSend(v7, "mutableCopy");
    customAttributes = v8->_customAttributes;
    v8->_customAttributes = (NSMutableDictionary *)v9;

  }
  return v8;
}

- (id)serializedAttributes
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99E08];
  -[CSSearchableItemAttributeSet attributes](self, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSMutableDictionary count](self->_customAttributes, "count"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_customAttributes, CFSTR("kCSCustomAttributes"));
  return v5;
}

- (BOOL)isValidAttributeSet
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[CSSearchableItemAttributeSet contentType](self, "contentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "_requiredAttributesForContentType:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v6 = v4;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v15;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v15 != v9)
              objc_enumerationMutation(v6);
            -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v11)
            {
              v12 = 0;
              goto LABEL_14;
            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v8)
            continue;
          break;
        }
      }
      v12 = 1;
LABEL_14:

    }
    else
    {
      v12 = 1;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)requiredAttributes
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = (void *)objc_opt_class();
  -[CSSearchableItemAttributeSet contentType](self, "contentType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_requiredAttributesForContentType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

+ (id)_requiredAttributesForContentType:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = _requiredAttributesForContentType__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_requiredAttributesForContentType__onceToken, &__block_literal_global_7);
  objc_msgSend((id)_requiredAttributesForContentType__requiredAttributes, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __66__CSSearchableItemAttributeSet__requiredAttributesForContentType___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("kMDItemAccountIdentifier"), CFSTR("kMDItemAuthorPersons"), CFSTR("kMDItemAccountHandles"), CFSTR("kMDItemPrimaryRecipientPersons"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0CA5B40];
  v4[0] = *MEMORY[0x1E0CA5BF0];
  v4[1] = v1;
  v5[0] = v0;
  v5[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_requiredAttributesForContentType__requiredAttributes;
  _requiredAttributesForContentType__requiredAttributes = v2;

}

void __57__CSSearchableItemAttributeSet_customAttributeDictionary__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4)
{
  void *v7;
  unint64_t IntValue;
  void *v9;
  uint64_t v10;
  void *v11;
  CSCustomAttributeKey *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v14 = *a4;
  v15 = *((_QWORD *)a4 + 2);
  if (_MDPlistGetPlistObjectType() == 240)
  {
    v14 = *a4;
    v15 = *((_QWORD *)a4 + 2);
    if (_MDPlistArrayGetCount() == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *a4;
      v15 = *((_QWORD *)a4 + 2);
      _MDPlistArrayGetPlistObjectAtIndex();
      IntValue = _MDPlistNumberGetIntValue();
      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
      v14 = *a4;
      v15 = *((_QWORD *)a4 + 2);
      _MDPlistArrayGetPlistObjectAtIndex();
      objc_msgSend(v9, "decodeObject:", &v13);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v7)
      {
        if (v10)
        {
          v12 = -[CSCustomAttributeKey initWithKeyName:searchable:searchableByDefault:unique:multiValued:]([CSCustomAttributeKey alloc], "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", v7, IntValue & 1, (IntValue >> 1) & 1, (IntValue >> 2) & 1, (IntValue >> 3) & 1);
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v11, v12);

        }
      }

    }
  }
}

- (void)_setValue:(id)a3 withClass:(Class)a4 forKey:(id)a5
{
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", a3, a4, a5, 0);
}

- (void)_setDataValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v7, objc_opt_class(), v6, 1);

}

- (void)_setURLValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v7, objc_opt_class(), v6, 0);

}

- (void)_setDictionaryValue:(id)a3 withValueClass:(Class)a4 keyClass:(Class)a5 forKey:(id)a6
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a6;
  if (!v8)
  {
LABEL_20:
    -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v8, 0, v9, 1);
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v8, "objectEnumerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      while (2)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v10);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            logForCSLogCategoryDefault();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              -[CSSearchableItemAttributeSet _setDictionaryValue:withValueClass:keyClass:forKey:].cold.2();

            goto LABEL_30;
          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v12)
          continue;
        break;
      }
    }

    v25 = 0u;
    v26 = 0u;
    v24 = 0u;
    objc_msgSend(v8, "keyEnumerator", 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
      while (2)
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v15);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            logForCSLogCategoryDefault();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              -[CSSearchableItemAttributeSet _setDictionaryValue:withValueClass:keyClass:forKey:].cold.1();

            goto LABEL_30;
          }
          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v17)
          continue;
        break;
      }
    }

    goto LABEL_20;
  }
  logForCSLogCategoryDefault();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:].cold.1();

LABEL_30:
}

- (BOOL)attributeIsDelete:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSMutableDictionary *customAttributes;
  CSDecoder *v9;
  __int128 *v10;
  CSDecoder *decoder;
  char v12;
  __int128 v13;
  $37FF168C8709F524D812460C59637AB1 reference;
  __int128 v15;
  $37FF168C8709F524D812460C59637AB1 v16;
  _BYTE v17[4096];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_mutableAttributes, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_2;
  customAttributes = self->_customAttributes;
  if (customAttributes)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](customAttributes, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_2;
  }
  if (!self->_decoder)
    goto LABEL_16;
  bzero(v17, 0x1000uLL);
  if ((objc_msgSend(v4, "getCString:maxLength:encoding:", v17, 4096, 4) & 1) == 0)
    goto LABEL_16;
  v15 = 0uLL;
  v16 = 0;
  v13 = *(_OWORD *)&self->_codedAttributes.containerBytes;
  reference = self->_codedAttributes.reference;
  if (!_MDPlistDictionaryGetPlistObjectForKey())
  {
    if (self->_hasCodedCustomAttributes)
    {
      v13 = *(_OWORD *)&self->_codedCustomAttributes.containerBytes;
      reference = self->_codedCustomAttributes.reference;
      if (_MDPlistDictionaryGetPlistObjectForKey())
      {
        v13 = v15;
        reference = v16;
        if (_MDPlistGetPlistObjectType() == 240)
        {
          v13 = v15;
          reference = v16;
          if (_MDPlistArrayGetCount() == 2)
          {
            decoder = self->_decoder;
            v13 = v15;
            reference = v16;
            _MDPlistArrayGetPlistObjectAtIndex();
            v10 = (__int128 *)&v12;
            v9 = decoder;
            goto LABEL_10;
          }
        }
      }
    }
LABEL_16:
    v6 = 0;
    goto LABEL_3;
  }
  v9 = self->_decoder;
  v13 = v15;
  reference = v16;
  v10 = &v13;
LABEL_10:
  -[CSDecoder decodeObject:](v9, "decodeObject:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_2:
  v6 = v5 == (void *)*MEMORY[0x1E0C9B0D0];

LABEL_3:
  return v6;
}

- (void)incrementAttributeValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(CFSTR(":INC:"), "stringByAppendingString:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet setAttribute:forKey:](self, "setAttribute:forKey:", v6, v7);

}

- (void)addAttributesFromDictionaryWithOutOverWriting:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[CSSearchableItemAttributeSet mutableAttributes](self, "mutableAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__CSSearchableItemAttributeSet_addAttributesFromDictionaryWithOutOverWriting___block_invoke;
  v7[3] = &unk_1E2401C80;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __78__CSSearchableItemAttributeSet_addAttributesFromDictionaryWithOutOverWriting___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v7);

}

- (void)addAttributesFromDictionary:(id)a3
{
  void *v4;
  NSDictionary *attributes;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    -[CSSearchableItemAttributeSet mutableAttributes](self, "mutableAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addEntriesFromDictionary:", v6);

    attributes = self->_attributes;
    self->_attributes = 0;

  }
}

- (CSSearchableItemAttributeSet)initWithDecoder:(id)a3 obj:(id *)a4
{
  id v7;
  char *v8;
  int Count;
  int v10;
  __int128 v12;
  $89967B733E8F0E8859294B5D59E7AF0F var2;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSSearchableItemAttributeSet;
  v8 = -[CSSearchableItemAttributeSet init](&v14, sel_init);
  if (!v8)
    goto LABEL_9;
  if (_MDPlistGetPlistObjectType() != 240)
  {
LABEL_8:

    v8 = 0;
    goto LABEL_9;
  }
  Count = _MDPlistArrayGetCount();
  if ((Count - 3) > 1)
  {
    objc_storeStrong((id *)v8 + 6, a3);
    goto LABEL_8;
  }
  v10 = Count;
  v12 = *(_OWORD *)&a4->var0;
  var2 = a4->var2;
  _MDPlistArrayGetPlistObjectAtIndex();
  objc_msgSend(v8, "setSearchableItemFlags:", _MDPlistNumberGetIntValue());
  _MDPlistArrayGetPlistObjectAtIndex();
  *(_OWORD *)(v8 + 72) = v12;
  *(($89967B733E8F0E8859294B5D59E7AF0F *)v8 + 11) = var2;
  if (v10 == 4)
  {
    v8[8] = 1;
    _MDPlistArrayGetPlistObjectAtIndex();
    *((_OWORD *)v8 + 6) = v12;
    *(($89967B733E8F0E8859294B5D59E7AF0F *)v8 + 14) = var2;
  }
  objc_storeStrong((id *)v8 + 6, a3);
LABEL_9:

  return (CSSearchableItemAttributeSet *)v8;
}

- (void)setContentObj:(id)a3 obj:(id *)a4
{
  __int128 v6;

  objc_storeStrong((id *)&self->_contentDecoder, a3);
  v6 = *(_OWORD *)&a4->var0;
  self->_contentObj.reference = ($37FF168C8709F524D812460C59637AB1)a4->var2;
  *(_OWORD *)&self->_contentObj.containerBytes = v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[CSSearchableItemAttributeSet uniqueIdentifier](self, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CSSearchableItemAttributeSet displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + v4;

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  $70FB98EE0919CC727AB8FBF44F6186F7 codedAttributes;

  if (!self->_decoder
    || (codedAttributes = self->_codedAttributes,
        CSDecodeObject((uint64_t)&codedAttributes),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "debugDescription"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    -[NSMutableDictionary debugDescription](self->_mutableAttributes, "debugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (-[NSMutableDictionary count](self->_customAttributes, "count"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[NSMutableDictionary debugDescription](self->_customAttributes, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@\nCustom:\n%@"), v4, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v4;
  }

  return v7;
}

+ (id)_allKeys
{
  if (_allKeys__once != -1)
    dispatch_once(&_allKeys__once, &__block_literal_global_121);
  return (id)_allKeys__allKeys;
}

void __40__CSSearchableItemAttributeSet__allKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[322];

  v3[321] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("kMDItemAttributeChangeDate");
  v3[1] = CFSTR("kMDItemContentType");
  v3[2] = CFSTR("kMDItemContentTypeTree");
  v3[3] = CFSTR("kMDItemKeywords");
  v3[4] = CFSTR("kMDItemTitle");
  v3[5] = CFSTR("kMDItemAuthors");
  v3[6] = CFSTR("kMDItemEditors");
  v3[7] = CFSTR("kMDItemParticipants");
  v3[8] = CFSTR("kMDItemProjects");
  v3[9] = CFSTR("kMDItemDownloadedDate");
  v3[10] = CFSTR("kMDItemWhereFroms");
  v3[11] = CFSTR("kMDItemComment");
  v3[12] = CFSTR("kMDItemCopyright");
  v3[13] = CFSTR("kMDItemLastUsedDate");
  v3[14] = CFSTR("kMDItemContentCreationDate");
  v3[15] = CFSTR("kMDItemContentModificationDate");
  v3[16] = CFSTR("kMDItemDateAdded");
  v3[17] = CFSTR("kMDItemDurationSeconds");
  v3[18] = CFSTR("kMDItemContactKeywords");
  v3[19] = CFSTR("kMDItemVersion");
  v3[20] = CFSTR("kMDItemPixelHeight");
  v3[21] = CFSTR("kMDItemPixelWidth");
  v3[22] = CFSTR("kMDItemPixelCount");
  v3[23] = CFSTR("kMDItemColorSpace");
  v3[24] = CFSTR("kMDItemBitsPerSample");
  v3[25] = CFSTR("kMDItemFlashOnOff");
  v3[26] = CFSTR("kMDItemXMPDigitalSourceType");
  v3[27] = CFSTR("kMDItemXMPCredit");
  v3[28] = CFSTR("kMDItemFocalLength");
  v3[29] = CFSTR("kMDItemAcquisitionMake");
  v3[30] = CFSTR("kMDItemAcquisitionModel");
  v3[31] = CFSTR("kMDItemISOSpeed");
  v3[32] = CFSTR("kMDItemOrientation");
  v3[33] = CFSTR("kMDItemLayerNames");
  v3[34] = CFSTR("kMDItemWhiteBalance");
  v3[35] = CFSTR("kMDItemAperture");
  v3[36] = CFSTR("kMDItemProfileName");
  v3[37] = CFSTR("kMDItemResolutionWidthDPI");
  v3[38] = CFSTR("kMDItemResolutionHeightDPI");
  v3[39] = CFSTR("kMDItemExposureMode");
  v3[40] = CFSTR("kMDItemExposureTimeSeconds");
  v3[41] = CFSTR("kMDItemEXIFVersion");
  v3[42] = CFSTR("kMDItemCameraOwner");
  v3[43] = CFSTR("kMDItemFocalLength35mm");
  v3[44] = CFSTR("kMDItemLensModel");
  v3[45] = CFSTR("kMDItemEXIFGPSVersion");
  v3[46] = CFSTR("kMDItemAltitude");
  v3[47] = CFSTR("kMDItemLatitude");
  v3[48] = CFSTR("kMDItemLongitude");
  v3[49] = CFSTR("kMDItemSpeed");
  v3[50] = CFSTR("kMDItemTimestamp");
  v3[51] = CFSTR("kMDItemGPSTrack");
  v3[52] = CFSTR("kMDItemImageDirection");
  v3[53] = CFSTR("kMDItemNamedLocation");
  v3[54] = CFSTR("kMDItemGPSStatus");
  v3[55] = CFSTR("kMDItemGPSMeasureMode");
  v3[56] = CFSTR("kMDItemGPSDOP");
  v3[57] = CFSTR("kMDItemGPSMapDatum");
  v3[58] = CFSTR("kMDItemGPSDestLatitude");
  v3[59] = CFSTR("kMDItemGPSDestLongitude");
  v3[60] = CFSTR("kMDItemGPSDestBearing");
  v3[61] = CFSTR("kMDItemGPSDestDistance");
  v3[62] = CFSTR("kMDItemGPSProcessingMethod");
  v3[63] = CFSTR("kMDItemGPSAreaInformation");
  v3[64] = CFSTR("kMDItemGPSDateStamp");
  v3[65] = CFSTR("kMDItemGPSDifferental");
  v3[66] = CFSTR("kMDItemCodecs");
  v3[67] = CFSTR("kMDItemMediaTypes");
  v3[68] = CFSTR("kMDItemStreamable");
  v3[69] = CFSTR("kMDItemTotalBitRate");
  v3[70] = CFSTR("kMDItemVideoBitRate");
  v3[71] = CFSTR("kMDItemAudioBitRate");
  v3[72] = CFSTR("kMDItemDeliveryType");
  v3[73] = CFSTR("kMDItemAlbum");
  v3[74] = CFSTR("kMDItemHasAlphaChannel");
  v3[75] = CFSTR("kMDItemRedEyeOnOff");
  v3[76] = CFSTR("kMDItemMeteringMode");
  v3[77] = CFSTR("kMDItemMaxAperture");
  v3[78] = CFSTR("kMDItemFNumber");
  v3[79] = CFSTR("kMDItemExposureProgram");
  v3[80] = CFSTR("kMDItemExposureTimeString");
  v3[81] = CFSTR("kMDItemHeadline");
  v3[82] = CFSTR("kMDItemInstructions");
  v3[83] = CFSTR("kMDItemThoroughfare");
  v3[84] = CFSTR("kMDItemSubThoroughfare");
  v3[85] = CFSTR("kMDItemPostalCode");
  v3[86] = CFSTR("kMDItemCity");
  v3[87] = CFSTR("kMDItemStateOrProvince");
  v3[88] = CFSTR("kMDItemCountry");
  v3[89] = CFSTR("kMDItemDisplayName");
  v3[90] = CFSTR("kMDItemPath");
  v3[91] = CFSTR("kMDItemTextContent");
  v3[92] = CFSTR("kMDItemAudioSampleRate");
  v3[93] = CFSTR("kMDItemAudioChannelCount");
  v3[94] = CFSTR("kMDItemTempo");
  v3[95] = CFSTR("kMDItemKeySignature");
  v3[96] = CFSTR("kMDItemTimeSignature");
  v3[97] = CFSTR("kMDItemAudioEncodingApplication");
  v3[98] = CFSTR("kMDItemComposer");
  v3[99] = CFSTR("kMDItemLyricist");
  v3[100] = CFSTR("kMDItemAudioTrackNumber");
  v3[101] = CFSTR("kMDItemRecordingDate");
  v3[102] = CFSTR("kMDItemMusicalGenre");
  v3[103] = CFSTR("kMDItemIsGeneralMIDISequence");
  v3[104] = CFSTR("kMDItemRecordingYear");
  v3[105] = CFSTR("kMDItemOrganizations");
  v3[106] = CFSTR("kMDItemRole");
  v3[107] = CFSTR("kMDItemLanguages");
  v3[108] = CFSTR("kMDItemRights");
  v3[109] = CFSTR("kMDItemPublishers");
  v3[110] = CFSTR("kMDItemContributors");
  v3[111] = CFSTR("kMDItemCoverage");
  v3[112] = CFSTR("kMDItemSubject");
  v3[113] = CFSTR("kMDItemTheme");
  v3[114] = CFSTR("kMDItemDescription");
  v3[115] = CFSTR("kMDItemIdentifier");
  v3[116] = CFSTR("kMDItemAudiences");
  v3[117] = CFSTR("kMDItemNumberOfPages");
  v3[118] = CFSTR("kMDItemFileSize");
  v3[119] = CFSTR("kMDItemPageWidth");
  v3[120] = CFSTR("kMDItemPageHeight");
  v3[121] = CFSTR("kMDItemSecurityMethod");
  v3[122] = CFSTR("kMDItemCreator");
  v3[123] = CFSTR("kMDItemEncodingApplications");
  v3[124] = CFSTR("kMDItemDueDate");
  v3[125] = CFSTR("kMDItemCompletionDate");
  v3[126] = CFSTR("kMDItemStartDate");
  v3[127] = CFSTR("kMDItemEndDate");
  v3[128] = CFSTR("kMDItemImportantDates");
  v3[129] = CFSTR("kMDItemStarRating");
  v3[130] = CFSTR("kMDItemRatingDescription");
  v3[131] = CFSTR("kMDItemPlayCount");
  v3[132] = CFSTR("kMDItemIsLocal");
  v3[133] = CFSTR("kMDItemContentRating");
  v3[134] = CFSTR("kMDItemExtendedContentRating");
  v3[135] = CFSTR("kMDItemArtist");
  v3[136] = CFSTR("kMDItemPhoneNumbers");
  v3[137] = CFSTR("kMDItemEmailAddresses");
  v3[138] = CFSTR("kMDItemInstantMessageAddresses");
  v3[139] = CFSTR("kMDItemKind");
  v3[140] = CFSTR("kMDItemRecipients");
  v3[141] = CFSTR("kMDItemFinderComment");
  v3[142] = CFSTR("kMDItemFonts");
  v3[143] = CFSTR("kMDItemAppleLoopsRootKey");
  v3[144] = CFSTR("kMDItemAppleLoopsKeyFilterType");
  v3[145] = CFSTR("kMDItemAppleLoopsLoopMode");
  v3[146] = CFSTR("kMDItemAppleLoopDescriptors");
  v3[147] = CFSTR("kMDItemMusicalInstrumentCategory");
  v3[148] = CFSTR("kMDItemMusicalInstrumentName");
  v3[149] = CFSTR("kMDItemSupportFileType");
  v3[150] = CFSTR("kMDItemInformation");
  v3[151] = CFSTR("kMDItemDirector");
  v3[152] = CFSTR("kMDItemProducer");
  v3[153] = CFSTR("kMDItemGenre");
  v3[154] = CFSTR("kMDItemPerformers");
  v3[155] = CFSTR("kMDItemOriginalFormat");
  v3[156] = CFSTR("kMDItemOriginalSource");
  v3[157] = CFSTR("kMDItemAuthorEmailAddresses");
  v3[158] = CFSTR("kMDItemRecipientEmailAddresses");
  v3[159] = CFSTR("kMDItemAuthorAddresses");
  v3[160] = CFSTR("kMDItemAuthorPhotosPersonIdentifiers");
  v3[161] = CFSTR("kMDItemRecipientPhotosPersonIdentifiers");
  v3[162] = CFSTR("kMDItemRecipientAddresses");
  v3[163] = CFSTR("kMDItemURL");
  v3[164] = CFSTR("kMDItemIsLikelyJunk");
  v3[165] = CFSTR("kMDItemExecutableArchitectures");
  v3[166] = CFSTR("kMDItemExecutablePlatform");
  v3[167] = CFSTR("kMDItemApplicationCategories");
  v3[168] = CFSTR("kMDItemIsApplicationManaged");
  v3[169] = CFSTR("kMDItemBundleIdentifier");
  v3[170] = CFSTR("kMDItemWeakRelatedUniqueIdentifier");
  v3[171] = CFSTR("kMDItemRelatedUniqueIdentifier");
  v3[172] = CFSTR("kMDItemAuthorPersons");
  v3[173] = CFSTR("kMDItemPrimaryRecipientPersons");
  v3[174] = CFSTR("kMDItemAdditionalRecipientPersons");
  v3[175] = CFSTR("kMDItemHiddenAdditionalRecipientPersons");
  v3[176] = CFSTR("kMDItemEmailHeadersDictionary");
  v3[177] = CFSTR("kMDItemAccountIdentifier");
  v3[178] = CFSTR("kMDItemAccountHandles");
  v3[179] = CFSTR("kMDItemMailboxes");
  v3[180] = CFSTR("kMDItemContentURL");
  v3[181] = CFSTR("MDItemThumbnailBundleID");
  v3[182] = CFSTR("MDItemThumbnailContentType");
  v3[183] = CFSTR("kMDItemThumbnailURL");
  v3[184] = CFSTR("kMDItemThumbnailData");
  v3[185] = CFSTR("kMDItemHTMLContentData");
  v3[186] = CFSTR("kMDItemAlternateNames");
  v3[187] = CFSTR("kMDQueryResultMatchedFields");
  v3[188] = CFSTR("kMDItemHTMLContent");
  v3[189] = CFSTR("kMDItemHTMLContent");
  v3[190] = CFSTR("kMDItemAuthorsDictionary");
  v3[191] = CFSTR("kMDItemPrimaryRecipientsDictionary");
  v3[192] = CFSTR("kMDItemAdditionalRecipientsDictionary");
  v3[193] = CFSTR("kMDItemHiddenAdditionalRecipientsDictionary");
  v3[194] = CFSTR("kMDItemAuthorContactProperties");
  v3[195] = CFSTR("kMDItemPrimaryRecipientContactProperties");
  v3[196] = CFSTR("kMDItemAdditionalRecipientContactProperties");
  v3[197] = CFSTR("kMDItemHiddenAdditionalRecipientContactProperties");
  v3[198] = CFSTR("kMDItemAccountType");
  v3[199] = CFSTR("kMDItemTextSelected");
  v3[200] = CFSTR("kMDItemSubtitle");
  v3[201] = CFSTR("kMDItemUserTags");
  v3[202] = CFSTR("kMDItemIsExistingThread");
  v3[203] = CFSTR("kMDItemIsPartiallyDownloaded");
  v3[204] = CFSTR("kMDItemAlbumPersistentID");
  v3[205] = CFSTR("kMDItemAdamID");
  v3[206] = CFSTR("kMDItemFileIdentifier");
  v3[207] = CFSTR("kMDItemFilename");
  v3[208] = CFSTR("kMDItemParentFileIdentifier");
  v3[209] = CFSTR("kMDItemDocumentIdentifier");
  v3[210] = CFSTR("kMDQueryResultMenuRelevance");
  v3[211] = CFSTR("kMDQueryResultNewMatchedExtraQueriesField");
  v3[212] = CFSTR("_kMDItemExternalID");
  v3[213] = CFSTR("_kMDItemDomainIdentifier");
  v3[214] = CFSTR("_kMDItemExpirationDate");
  v3[215] = CFSTR("_kMDItemUserActivityType");
  v3[216] = CFSTR("kMDItemApplicationName");
  v3[217] = CFSTR("kMDItemSupportsPhoneCall");
  v3[218] = CFSTR("kMDItemSupportsNavigation");
  v3[219] = CFSTR("kMDItemRankingHint");
  v3[220] = CFSTR("kMDItemUserCurated");
  v3[221] = CFSTR("kMDItemUserCreated");
  v3[222] = CFSTR("kMDItemUserOwned");
  v3[223] = CFSTR("kMDItemPhotosPeople");
  v3[224] = CFSTR("kMDItemPhotosPeopleNames");
  v3[225] = CFSTR("kMDItemPhotosPeopleAddresses");
  v3[226] = CFSTR("kMDItemPhotosPeopleEmailAddresses");
  v3[227] = CFSTR("kMDItemPhotosPeoplePhoneNumbers");
  v3[228] = CFSTR("kMDItemPhotosPeopleContactIdentifiers");
  v3[229] = CFSTR("kMDItemPhotosPeoplePersonIdentifiers");
  v3[230] = CFSTR("kMDItemAestheticScore");
  v3[231] = CFSTR("kMDItemCurationScore");
  v3[232] = CFSTR("_kMDItemIsCinematicVideo");
  v3[233] = CFSTR("kMDItemIsProResVideo");
  v3[234] = CFSTR("kMDItemSavingApplication");
  v3[235] = CFSTR("kMDItemSavingApplicationBundleIdentifier");
  v3[236] = CFSTR("kMDItemPhotosBusinessCategories");
  v3[237] = CFSTR("kMDItemPhotosBusinessNames");
  v3[238] = CFSTR("kMDItemPhotosContentCreationDateMonth");
  v3[239] = CFSTR("kMDItemPhotosContentCreationDateMonths");
  v3[240] = CFSTR("kMDItemPhotosContentCreationDateYear");
  v3[241] = CFSTR("kMDItemPhotosContentCreationDateYears");
  v3[242] = CFSTR("kMDItemPhotosEventCategories");
  v3[243] = CFSTR("kMDItemPhotosEventNames");
  v3[244] = CFSTR("kMDItemPhotosEventPerformers");
  v3[245] = CFSTR("kMDItemPhotosFavorited");
  v3[246] = CFSTR("kMDItemPhotosFavorites");
  v3[247] = CFSTR("kMDItemPhotosHolidays");
  v3[248] = CFSTR("kMDItemPhotosKeywords");
  v3[249] = CFSTR("kMDItemPhotosMeanings");
  v3[250] = CFSTR("kMDItemPhotosMediaTypes");
  v3[251] = CFSTR("kMDItemPhotosMemoryTitle");
  v3[252] = CFSTR("kMDItemPhotosSceneClassification");
  v3[253] = CFSTR("kMDItemPhotosSceneClassificationLabels");
  v3[254] = CFSTR("kMDItemPhotosSceneClassificationSynonyms");
  v3[255] = CFSTR("kMDItemPhotosSceneClassificationConfidences");
  v3[256] = CFSTR("kMDItemPhotosSceneClassificationIdentifiers");
  v3[257] = CFSTR("kMDItemPhotosSceneClassificationTypes");
  v3[258] = CFSTR("kMDItemPhotosSceneClassificationMediaTypes");
  v3[259] = CFSTR("kMDItemPhotosLocationKeywords");
  v3[260] = CFSTR("kMDItemPhotosEntityTitle");
  v3[261] = CFSTR("kMDItemDocumentUnderstandingTopics");
  v3[262] = CFSTR("kMDItemDocumentUnderstandingTopicsLabels");
  v3[263] = CFSTR("kMDItemDocumentUnderstandingTopicsSynonyms");
  v3[264] = CFSTR("kMDItemDocumentUnderstandingTopicsConfidences");
  v3[265] = CFSTR("kMDItemDocumentUnderstandingTopicsVersion");
  v3[266] = CFSTR("kMDItemDocumentUnderstandingCategories");
  v3[267] = CFSTR("kMDItemDocumentUnderstandingCategoriesLabels");
  v3[268] = CFSTR("kMDItemDocumentUnderstandingCategoriesSynonyms");
  v3[269] = CFSTR("kMDItemDocumentUnderstandingCategoriesConfidences");
  v3[270] = CFSTR("kMDItemDocumentUnderstandingCategoriesVersion");
  v3[271] = CFSTR("kMDItemPhotosTimeZoneName");
  v3[272] = CFSTR("kMDItemPhotosTimeZoneOffset");
  v3[273] = CFSTR("kMDItemPhotosInferredTimeZoneOffset");
  v3[274] = CFSTR("kMDItemPhotosTitle");
  v3[275] = CFSTR("kMDItemPhotosDescription");
  v3[276] = CFSTR("com_apple_mobilesms_isHighlightedContent");
  v3[277] = CFSTR("kMDItemSyndicatedContentServerDate");
  v3[278] = CFSTR("kMDItemHashtags");
  v3[279] = CFSTR("kMDItemHasLPMedia");
  v3[280] = CFSTR("kMDItemLPMediaPaths");
  v3[281] = CFSTR("kMDItemGroupPhotoPath");
  v3[282] = CFSTR("_kMDItemRequiresImport");
  v3[283] = CFSTR("_kMDItemImportSandboxExtension");
  v3[284] = CFSTR("_kMDItemHasTopMomentScore");
  v3[285] = CFSTR("_kMDItemEligibleForPhotosProcessing");
  v3[286] = CFSTR("_MDItemLastMotionActivityState");
  v3[287] = CFSTR("kMDQueryResultMatchingHints");
  v3[288] = CFSTR("kMDItemAuthorContactDSID");
  v3[289] = CFSTR("kMDItemApproverContactDSID");
  v3[290] = CFSTR("_kMDItemPotentialEventMessage");
  v3[291] = CFSTR("kMDItemPhotosLibraryName");
  v3[292] = CFSTR("kMDItemPhotosContributor");
  v3[293] = CFSTR("MDItemPhotosContributorName");
  v3[294] = CFSTR("kMDItemPhotosContributorContactIdentifier");
  v3[295] = CFSTR("kMDItemPhotosDonationState");
  v3[296] = CFSTR("kMDItemPhotosCharacterRecognitionAnalysisVersion");
  v3[297] = CFSTR("kMDItemPhotosFaceAnalysisVersion");
  v3[298] = CFSTR("kMDItemPhotosLocationPrivateEncryptedComputeAnalysisVersion");
  v3[299] = CFSTR("kMDItemPhotosMediaAnalysisVersion");
  v3[300] = CFSTR("kMDItemPhotosMediaAnalysisImageVersion");
  v3[301] = CFSTR("kMDItemPhotosPrivateEncryptedComputeAnalysisVersion");
  v3[302] = CFSTR("kMDItemPhotosSceneAnalysisVersion");
  v3[303] = CFSTR("kMDItemPhotosUtilityTypes");
  v3[304] = CFSTR("MDItemCachedViewData");
  v3[305] = CFSTR("_kMDItemSummarizedIdentifiers");
  v3[306] = CFSTR("_kMDItemSummarizationContentTopLine");
  v3[307] = CFSTR("_kMDItemSummarizationContentSynopsis");
  v3[308] = CFSTR("_kMDItemSummarizationContentTopic");
  v3[309] = CFSTR("_kMDItemIsNew");
  v3[310] = CFSTR("_kMDItemIsTwoFactorCode");
  v3[311] = CFSTR("_kMDItemIsFromMe");
  v3[312] = CFSTR("_kMDItemIsGroupThread");
  v3[313] = CFSTR("kMDItemDisableSearchInSpotlight");
  v3[314] = CFSTR("_kMDItemRequiresMediaAnalysis");
  v3[315] = CFSTR("_kMDItemMediaAnalysisComplete");
  v3[316] = CFSTR("_kMDItemSmartRepliesResponse");
  v3[317] = CFSTR("_kMDItemSmartRepliesStatus");
  v3[318] = CFSTR("_kMDItemSerialNumber");
  v3[319] = CFSTR("_kMDItemIndexIdentifier");
  v3[320] = CFSTR("kMDItemDetectedEventTypes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 321);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_allKeys__allKeys;
  _allKeys__allKeys = v1;

}

+ (id)_sharedAttributeKeySet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CSSearchableItemAttributeSet__sharedAttributeKeySet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_sharedAttributeKeySet__once != -1)
    dispatch_once(&_sharedAttributeKeySet__once, block);
  return (id)_sharedAttributeKeySet__sharedKeySet;
}

void __54__CSSearchableItemAttributeSet__sharedAttributeKeySet__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(*(id *)(a1 + 32), "_allKeys");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sharedKeySetForKeys:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_sharedAttributeKeySet__sharedKeySet;
  _sharedAttributeKeySet__sharedKeySet = v3;

}

- (CSDecoder)contentDecoder
{
  return self->_contentDecoder;
}

- ($781B0FC3B6CF89EDF0F49E4213B771BC)contentObj
{
  *($70FB98EE0919CC727AB8FBF44F6186F7 *)retstr = ($70FB98EE0919CC727AB8FBF44F6186F7)self[5];
  return self;
}

- (BOOL)hasKnownKeysDictionary
{
  return self->_hasKnownKeysDictionary;
}

- (NSArray)matchingHints
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMatchingHints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setAlternateNames:(NSArray *)alternateNames
{
  NSArray *v4;

  v4 = alternateNames;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemAlternateNames"));

}

- (NSArray)alternateNames
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAlternateNames"));
}

- (void)setPath:(NSString *)path
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", path, CFSTR("kMDItemPath"));
}

- (NSString)path
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPath"));
}

- (void)setHTMLContentData:(NSData *)HTMLContentData
{
  CSDecoder *contentDecoder;

  -[CSSearchableItemAttributeSet _setDataValue:forKey:](self, "_setDataValue:forKey:", HTMLContentData, CFSTR("kMDItemHTMLContentData"));
  contentDecoder = self->_contentDecoder;
  self->_contentDecoder = 0;

}

- (void)setTextContent:(NSString *)textContent
{
  CSDecoder *contentDecoder;

  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", textContent, CFSTR("kMDItemTextContent"));
  contentDecoder = self->_contentDecoder;
  self->_contentDecoder = 0;

}

- (void)setTextContentPieces:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  double v15;
  double v16;
  id v17;
  char v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  CSSearchableItemAttributeSet *v38;
  uint64_t v39;
  uint64_t v40;
  id obj;
  id obja;
  void *v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = (void *)objc_msgSend(v4, "copy");
      goto LABEL_150;
    }
    goto LABEL_106;
  }
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (objc_msgSend(v4, "count"))
    {
      v37 = v4;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      obja = v4;
      v24 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      if (v24)
      {
        v25 = v24;
        v23 = 0;
        v26 = *(_QWORD *)v50;
        v39 = *(_QWORD *)v50;
        do
        {
          v27 = 0;
          v40 = v25;
          do
          {
            if (*(_QWORD *)v50 != v26)
              objc_enumerationMutation(obja);
            v28 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v27);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v44 = v27;
              v47 = 0u;
              v48 = 0u;
              v45 = 0u;
              v46 = 0u;
              v29 = v28;
              v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
              if (v30)
              {
                v31 = v30;
                v32 = *(_QWORD *)v46;
                do
                {
                  for (i = 0; i != v31; ++i)
                  {
                    if (*(_QWORD *)v46 != v32)
                      objc_enumerationMutation(v29);
                    v34 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      if (v23)
                        objc_msgSend(v23, "appendString:", CFSTR("\n"));
                      else
                        v23 = (void *)objc_opt_new();
                      objc_msgSend(v23, "appendString:", v34, v37);
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        if (v23)
                          objc_msgSend(v23, "appendString:", CFSTR("\n"));
                        else
                          v23 = (void *)objc_opt_new();
                        objc_msgSend(v34, "appendToString:", v23, v37);
                      }
                    }
                  }
                  v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
                }
                while (v31);
              }

              v26 = v39;
              v25 = v40;
              v27 = v44;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if (v23)
                  objc_msgSend(v23, "appendString:", CFSTR("\n"));
                else
                  v23 = (void *)objc_opt_new();
                objc_msgSend(v23, "appendString:", v28, v37);
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  if (v23)
                    objc_msgSend(v23, "appendString:", CFSTR("\n"));
                  else
                    v23 = (void *)objc_opt_new();
                  objc_msgSend(v28, "appendToString:", v23, v37);
                }
              }
            }
            ++v27;
          }
          while (v27 != v25);
          v25 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
        }
        while (v25);
      }
      else
      {
        v23 = 0;
      }

      v4 = v37;
      goto LABEL_150;
    }
LABEL_106:
    v23 = 0;
    goto LABEL_150;
  }
  v37 = v4;
  v38 = self;
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_251);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    obj = 0;
    v43 = 0;
    v12 = *(_QWORD *)v54;
    while (1)
    {
      for (j = 0; j != v9; ++j)
      {
        if (*(_QWORD *)v54 != v12)
          objc_enumerationMutation(v7);
        v14 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j);
        if (*(_QWORD *)(v14 + 88))
        {
          if (!*(_BYTE *)(v14 + 96))
          {
            v15 = *(double *)(v14 + 80);
            v16 = *(double *)(v14 + 32);
            v17 = *(id *)(v14 + 8);
            if (v15 >= 0.03)
            {
              if (v16 < 0.7)
              {
                objc_opt_class();
                v18 = objc_opt_isKindOfClass();
                if (v16 >= 0.5)
                  goto LABEL_30;
                goto LABEL_23;
              }
            }
            else if (v15 >= 0.02)
            {
              if (v16 < 0.8)
              {
                objc_opt_class();
                v18 = objc_opt_isKindOfClass();
                if (v16 >= 0.6)
                  goto LABEL_30;
                goto LABEL_23;
              }
            }
            else if (v16 < 0.9)
            {
              objc_opt_class();
              v18 = objc_opt_isKindOfClass();
              if (v16 >= 0.7)
              {
LABEL_30:
                if ((v18 & 1) != 0)
                {
                  if (v43)
                  {
                    objc_msgSend(v43, "appendString:", CFSTR("\n"));
                    v19 = v43;
                  }
                  else
                  {
                    v19 = (void *)objc_opt_new();
                  }
                  v43 = v19;
                  goto LABEL_53;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  if (v43)
                  {
                    objc_msgSend(v43, "appendString:", CFSTR("\n"));
                    v20 = (uint64_t)v43;
                  }
                  else
                  {
                    v20 = objc_opt_new();
                  }
                  v21 = v17;
                  v43 = (void *)v20;
                  goto LABEL_60;
                }
LABEL_62:

                continue;
              }
LABEL_23:
              if ((v18 & 1) != 0)
              {
                if (obj)
                {
                  objc_msgSend(obj, "appendString:", CFSTR("\n"));
                  v19 = obj;
                }
                else
                {
                  v19 = (void *)objc_opt_new();
                }
                obj = v19;
LABEL_53:
                objc_msgSend(v19, "appendString:", v17);
                goto LABEL_62;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_62;
              if (obj)
              {
                objc_msgSend(obj, "appendString:", CFSTR("\n"));
                v20 = (uint64_t)obj;
              }
              else
              {
                v20 = objc_opt_new();
              }
              v21 = v17;
              obj = (id)v20;
LABEL_60:
              v22 = (void *)v20;
              goto LABEL_61;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (v11)
                objc_msgSend(v11, "appendString:", CFSTR("\n"));
              else
                v11 = (void *)objc_opt_new();
              v19 = v11;
              goto LABEL_53;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_62;
            if (v11)
              objc_msgSend(v11, "appendString:", CFSTR("\n"));
            else
              v11 = (void *)objc_opt_new();
            v21 = v17;
            v22 = v11;
LABEL_61:
            objc_msgSend(v21, "appendToString:", v22);
            goto LABEL_62;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (v10)
              objc_msgSend(v10, "appendString:", CFSTR("\n"));
            else
              v10 = (void *)objc_opt_new();
            objc_msgSend(v10, "appendString:", *(_QWORD *)(v14 + 8));
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (v10)
                objc_msgSend(v10, "appendString:", CFSTR("\n"));
              else
                v10 = (void *)objc_opt_new();
              objc_msgSend(*(id *)(v14 + 8), "appendToString:", v10);
            }
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      if (!v9)
        goto LABEL_108;
    }
  }
  v10 = 0;
  v11 = 0;
  obj = 0;
  v43 = 0;
LABEL_108:
  v35 = obj;
  v36 = v43;
  if (v10 || v11 || v43 || obj)
  {
    v4 = v37;
    if (v10)
    {
      -[CSSearchableItemAttributeSet _setStringValue:forKey:](v38, "_setStringValue:forKey:", v10, CFSTR("_kMDItemOCRContentTitle"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = (void *)objc_opt_new();
        objc_msgSend(v23, "appendString:", v10);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v23 = (void *)objc_opt_new();
          objc_msgSend(v10, "appendToString:", v23);
        }
        else
        {
          v23 = 0;
        }
      }
      v35 = obj;
      v36 = v43;
    }
    else
    {
      v23 = 0;
    }
    if (v11)
    {
      -[CSSearchableItemAttributeSet _setStringValue:forKey:](v38, "_setStringValue:forKey:", v11, CFSTR("_kMDItemOCRContentLevel1"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v23)
          objc_msgSend(v23, "appendString:", CFSTR("\n"));
        else
          v23 = (void *)objc_opt_new();
        objc_msgSend(v23, "appendString:", v11);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v23)
            objc_msgSend(v23, "appendString:", CFSTR("\n"));
          else
            v23 = (void *)objc_opt_new();
          objc_msgSend(v11, "appendToString:", v23);
        }
      }
      v35 = obj;
      v36 = v43;
    }
    if (v36)
    {
      -[CSSearchableItemAttributeSet _setStringValue:forKey:](v38, "_setStringValue:forKey:", v36, CFSTR("_kMDItemOCRContentLevel2"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v23)
          objc_msgSend(v23, "appendString:", CFSTR("\n"));
        else
          v23 = (void *)objc_opt_new();
        objc_msgSend(v23, "appendString:", v43);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v23)
            objc_msgSend(v23, "appendString:", CFSTR("\n"));
          else
            v23 = (void *)objc_opt_new();
          objc_msgSend(v43, "appendToString:", v23);
        }
      }
      v35 = obj;
    }
    if (v35)
    {
      -[CSSearchableItemAttributeSet _setStringValue:forKey:](v38, "_setStringValue:forKey:", obj, CFSTR("_kMDItemOCRContentLevel3"));
      v35 = obj;
    }
  }
  else
  {
    v23 = 0;
    v4 = v37;
  }

  self = v38;
LABEL_150:
  -[CSSearchableItemAttributeSet setTextContent:](self, "setTextContent:", v23, v37);

}

uint64_t __67__CSSearchableItemAttributeSet_CSAttributes__setTextContentPieces___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double *v6;
  double *v7;
  double *v8;
  double v9;
  double v10;
  uint64_t v11;

  v4 = a2;
  v5 = a3;
  v6 = (double *)v4;
  v7 = (double *)v5;
  v8 = v7;
  v9 = v6[8];
  v10 = v7[8];
  if (v9 <= v10)
    v11 = v9 < v10 || v6[7] > v7[7];
  else
    v11 = -1;

  return v11;
}

- (id)textContentPieces
{
  return 0;
}

- (void)setAuthors:(NSArray *)authors
{
  NSArray *v4;

  v4 = authors;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemAuthorPersons"));

}

- (void)setPrimaryRecipients:(NSArray *)primaryRecipients
{
  NSArray *v4;

  v4 = primaryRecipients;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemPrimaryRecipientPersons"));

}

- (void)setAdditionalRecipients:(NSArray *)additionalRecipients
{
  NSArray *v4;

  v4 = additionalRecipients;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemAdditionalRecipientPersons"));

}

- (void)setHiddenAdditionalRecipients:(NSArray *)hiddenAdditionalRecipients
{
  NSArray *v4;

  v4 = hiddenAdditionalRecipients;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemHiddenAdditionalRecipientPersons"));

}

- (void)setEmailHeaders:(NSDictionary *)emailHeaders
{
  NSDictionary *v4;

  v4 = emailHeaders;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEmailHeadersDictionary"), 1);

}

- (NSString)relatedUniqueIdentifier
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemRelatedUniqueIdentifier"));
}

- (void)setWeakRelatedUniqueIdentifier:(NSString *)weakRelatedUniqueIdentifier
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", weakRelatedUniqueIdentifier, CFSTR("kMDItemWeakRelatedUniqueIdentifier"));
}

- (NSString)weakRelatedUniqueIdentifier
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemWeakRelatedUniqueIdentifier"));
}

- (void)setContentURL:(NSURL *)contentURL
{
  NSURL *v4;

  v4 = contentURL;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemContentURL"), 0);

}

- (void)setThumbnailBundleID:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("MDItemThumbnailBundleID"), 1);

}

- (NSString)thumbnailBundleID
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("MDItemThumbnailBundleID"));
}

- (void)setThumbnailContentType:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("MDItemThumbnailContentType"), 1);

}

- (NSString)thumbnailContentType
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("MDItemThumbnailContentType"));
}

- (void)setIsWebClip:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemIsWebClip"), 0);

}

- (NSNumber)isWebClip
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemIsWebClip"));
}

- (void)setThumbnailURL:(NSURL *)thumbnailURL
{
  NSURL *v4;

  v4 = thumbnailURL;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemThumbnailURL"), 0);

}

- (NSURL)thumbnailURL
{
  void *v2;
  id v3;
  void *v4;

  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemThumbnailURL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
LABEL_7:

  return (NSURL *)v4;
}

- (void)setThumbnailData:(NSData *)thumbnailData
{
  -[CSSearchableItemAttributeSet _setDataValue:forKey:](self, "_setDataValue:forKey:", thumbnailData, CFSTR("kMDItemThumbnailData"));
}

- (NSData)thumbnailData
{
  return (NSData *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemThumbnailData"));
}

- (void)setDarkThumbnailURL:(NSURL *)darkThumbnailURL
{
  NSURL *v4;

  v4 = darkThumbnailURL;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemDarkThumbnailURL"), 0);

}

- (NSURL)darkThumbnailURL
{
  void *v2;
  id v3;
  void *v4;

  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemDarkThumbnailURL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
LABEL_7:

  return (NSURL *)v4;
}

- (void)setAccountIdentifier:(NSString *)accountIdentifier
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", accountIdentifier, CFSTR("kMDItemAccountIdentifier"));
}

- (NSString)accountIdentifier
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAccountIdentifier"));
}

- (void)setAccountHandles:(NSArray *)accountHandles
{
  NSArray *v4;

  v4 = accountHandles;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemAccountHandles"));

}

- (NSArray)accountHandles
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAccountHandles"));
}

- (void)setMailboxIdentifiers:(NSArray *)mailboxIdentifiers
{
  NSArray *v4;

  v4 = mailboxIdentifiers;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemMailboxes"));

}

- (NSArray)mailboxIdentifiers
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemMailboxes"));
}

- (void)setMetadataModificationDate:(NSDate *)metadataModificationDate
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", metadataModificationDate, CFSTR("kMDItemAttributeChangeDate"));
}

- (NSDate)metadataModificationDate
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAttributeChangeDate"));
}

- (NSArray)keywords
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemKeywords"));
}

- (NSString)title
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemTitle"));
}

- (void)setAuthorNames:(NSArray *)authorNames
{
  NSArray *v4;

  v4 = authorNames;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemAuthors"));

}

- (void)setRecipientNames:(NSArray *)recipientNames
{
  NSArray *v4;

  v4 = recipientNames;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemRecipients"));

}

- (void)setEditors:(NSArray *)editors
{
  NSArray *v4;

  v4 = editors;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemEditors"));

}

- (NSArray)editors
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEditors"));
}

- (void)setParticipants:(NSArray *)participants
{
  NSArray *v4;

  v4 = participants;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemParticipants"));

}

- (NSArray)participants
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemParticipants"));
}

- (void)setAuthorEmailAddresses:(NSArray *)authorEmailAddresses
{
  NSArray *v4;

  v4 = authorEmailAddresses;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemAuthorEmailAddresses"));

}

- (NSArray)authorEmailAddresses
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAuthorEmailAddresses"));
}

- (void)setRecipientEmailAddresses:(NSArray *)recipientEmailAddresses
{
  NSArray *v4;

  v4 = recipientEmailAddresses;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemRecipientEmailAddresses"));

}

- (void)setAuthorAddresses:(NSArray *)authorAddresses
{
  NSArray *v4;

  v4 = authorAddresses;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemAuthorAddresses"));

}

- (NSArray)authorAddresses
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAuthorAddresses"));
}

- (void)setRecipientAddresses:(NSArray *)recipientAddresses
{
  NSArray *v4;

  v4 = recipientAddresses;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemRecipientAddresses"));

}

- (NSArray)recipientAddresses
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemRecipientAddresses"));
}

- (void)setProjects:(NSArray *)projects
{
  NSArray *v4;

  v4 = projects;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemProjects"));

}

- (NSArray)projects
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemProjects"));
}

- (void)setDownloadedDate:(NSDate *)downloadedDate
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", downloadedDate, CFSTR("kMDItemDownloadedDate"));
}

- (NSDate)downloadedDate
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemDownloadedDate"));
}

- (void)setContentSources:(NSArray *)contentSources
{
  NSArray *v4;

  v4 = contentSources;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemWhereFroms"));

}

- (NSArray)contentSources
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemWhereFroms"));
}

- (void)setComment:(NSString *)comment
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", comment, CFSTR("kMDItemComment"));
}

- (NSString)comment
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemComment"));
}

- (void)setCopyright:(NSString *)copyright
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", copyright, CFSTR("kMDItemCopyright"));
}

- (NSString)copyright
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemCopyright"));
}

- (void)setLastUsedDate:(NSDate *)lastUsedDate
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", lastUsedDate, CFSTR("kMDItemLastUsedDate"));
}

- (void)setLastAppEngagementDate:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemLastAppEngagementDate"), 0);

}

- (id)lastAppEngagementDate
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemLastAppEngagementDate"));
}

- (void)setLastAppSearchEngagementQuery:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemLastAppSearchEngagementQuery"), 1);

}

- (id)lastAppSearchEngagementQuery
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemLastAppSearchEngagementQuery"));
}

- (void)setLastAppSearchEngagementRenderPosition:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemLastAppSearchEngagementRenderPosition"), 0);

}

- (id)lastAppSearchEngagementRenderPosition
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemLastAppSearchEngagementRenderPosition"));
}

- (void)setContentCreationDate:(NSDate *)contentCreationDate
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", contentCreationDate, CFSTR("kMDItemContentCreationDate"));
}

- (void)setContentModificationDate:(NSDate *)contentModificationDate
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", contentModificationDate, CFSTR("kMDItemContentModificationDate"));
}

- (void)setAddedDate:(NSDate *)addedDate
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", addedDate, CFSTR("kMDItemDateAdded"));
}

- (NSDate)addedDate
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemDateAdded"));
}

- (void)setDuration:(NSNumber *)duration
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", duration, CFSTR("kMDItemDurationSeconds"));
}

- (NSNumber)duration
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemDurationSeconds"));
}

- (void)setContactKeywords:(NSArray *)contactKeywords
{
  NSArray *v4;

  v4 = contactKeywords;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemContactKeywords"));

}

- (NSArray)contactKeywords
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemContactKeywords"));
}

- (void)setVersion:(NSString *)version
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", version, CFSTR("kMDItemVersion"));
}

- (NSString)version
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemVersion"));
}

- (void)setPixelHeight:(NSNumber *)pixelHeight
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", pixelHeight, CFSTR("kMDItemPixelHeight"));
}

- (NSNumber)pixelHeight
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPixelHeight"));
}

- (void)setPixelWidth:(NSNumber *)pixelWidth
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", pixelWidth, CFSTR("kMDItemPixelWidth"));
}

- (NSNumber)pixelWidth
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPixelWidth"));
}

- (void)setPixelCount:(NSNumber *)pixelCount
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", pixelCount, CFSTR("kMDItemPixelCount"));
}

- (NSNumber)pixelCount
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPixelCount"));
}

- (void)setColorSpace:(NSString *)colorSpace
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", colorSpace, CFSTR("kMDItemColorSpace"));
}

- (NSString)colorSpace
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemColorSpace"));
}

- (void)setBitsPerSample:(NSNumber *)bitsPerSample
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", bitsPerSample, CFSTR("kMDItemBitsPerSample"));
}

- (NSNumber)bitsPerSample
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemBitsPerSample"));
}

- (void)setFlashOn:(NSNumber *)flashOn
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", flashOn, CFSTR("kMDItemFlashOnOff"));
}

- (NSNumber)isFlashOn
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemFlashOnOff"));
}

- (void)setFocalLength:(NSNumber *)focalLength
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", focalLength, CFSTR("kMDItemFocalLength"));
}

- (NSNumber)focalLength
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemFocalLength"));
}

- (void)setFocalLength35mm:(NSNumber *)focalLength35mm
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", focalLength35mm, CFSTR("kMDItemFocalLength35mm"));
}

- (NSNumber)isFocalLength35mm
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemFocalLength35mm"));
}

- (void)setAcquisitionMake:(NSString *)acquisitionMake
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", acquisitionMake, CFSTR("kMDItemAcquisitionMake"));
}

- (NSString)acquisitionMake
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAcquisitionMake"));
}

- (void)setAcquisitionModel:(NSString *)acquisitionModel
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", acquisitionModel, CFSTR("kMDItemAcquisitionModel"));
}

- (NSString)acquisitionModel
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAcquisitionModel"));
}

- (void)setCameraOwner:(NSString *)cameraOwner
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", cameraOwner, CFSTR("kMDItemCameraOwner"));
}

- (NSString)cameraOwner
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemCameraOwner"));
}

- (void)setLensModel:(NSString *)lensModel
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", lensModel, CFSTR("kMDItemLensModel"));
}

- (NSString)lensModel
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemLensModel"));
}

- (void)setISOSpeed:(NSNumber *)ISOSpeed
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", ISOSpeed, CFSTR("kMDItemISOSpeed"));
}

- (NSNumber)ISOSpeed
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemISOSpeed"));
}

- (void)setOrientation:(NSNumber *)orientation
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", orientation, CFSTR("kMDItemOrientation"));
}

- (NSNumber)orientation
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemOrientation"));
}

- (void)setLayerNames:(NSArray *)layerNames
{
  NSArray *v4;

  v4 = layerNames;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemLayerNames"));

}

- (NSArray)layerNames
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemLayerNames"));
}

- (void)setWhiteBalance:(NSNumber *)whiteBalance
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", whiteBalance, CFSTR("kMDItemWhiteBalance"));
}

- (NSNumber)whiteBalance
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemWhiteBalance"));
}

- (void)setAperture:(NSNumber *)aperture
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", aperture, CFSTR("kMDItemAperture"));
}

- (NSNumber)aperture
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAperture"));
}

- (void)setProfileName:(NSString *)profileName
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", profileName, CFSTR("kMDItemProfileName"));
}

- (NSString)profileName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemProfileName"));
}

- (void)setResolutionWidthDPI:(NSNumber *)resolutionWidthDPI
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", resolutionWidthDPI, CFSTR("kMDItemResolutionWidthDPI"));
}

- (NSNumber)resolutionWidthDPI
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemResolutionWidthDPI"));
}

- (void)setResolutionHeightDPI:(NSNumber *)resolutionHeightDPI
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", resolutionHeightDPI, CFSTR("kMDItemResolutionHeightDPI"));
}

- (NSNumber)resolutionHeightDPI
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemResolutionHeightDPI"));
}

- (void)setExposureMode:(NSNumber *)exposureMode
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", exposureMode, CFSTR("kMDItemExposureMode"));
}

- (NSNumber)exposureMode
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemExposureMode"));
}

- (void)setExposureTime:(NSNumber *)exposureTime
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", exposureTime, CFSTR("kMDItemExposureTimeSeconds"));
}

- (NSNumber)exposureTime
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemExposureTimeSeconds"));
}

- (void)setEXIFVersion:(NSString *)EXIFVersion
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", EXIFVersion, CFSTR("kMDItemEXIFVersion"));
}

- (NSString)EXIFVersion
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEXIFVersion"));
}

- (void)setEXIFGPSVersion:(NSString *)EXIFGPSVersion
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", EXIFGPSVersion, CFSTR("kMDItemEXIFGPSVersion"));
}

- (NSString)EXIFGPSVersion
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEXIFGPSVersion"));
}

- (void)setCodecs:(NSArray *)codecs
{
  NSArray *v4;

  v4 = codecs;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemCodecs"));

}

- (NSArray)codecs
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemCodecs"));
}

- (void)setMediaTypes:(NSArray *)mediaTypes
{
  NSArray *v4;

  v4 = mediaTypes;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemMediaTypes"));

}

- (NSArray)mediaTypes
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemMediaTypes"));
}

- (void)setStreamable:(NSNumber *)streamable
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", streamable, CFSTR("kMDItemStreamable"));
}

- (NSNumber)isStreamable
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemStreamable"));
}

- (void)setTotalBitRate:(NSNumber *)totalBitRate
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", totalBitRate, CFSTR("kMDItemTotalBitRate"));
}

- (NSNumber)totalBitRate
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemTotalBitRate"));
}

- (void)setVideoBitRate:(NSNumber *)videoBitRate
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", videoBitRate, CFSTR("kMDItemVideoBitRate"));
}

- (NSNumber)videoBitRate
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemVideoBitRate"));
}

- (void)setAudioBitRate:(NSNumber *)audioBitRate
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", audioBitRate, CFSTR("kMDItemAudioBitRate"));
}

- (NSNumber)audioBitRate
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAudioBitRate"));
}

- (void)setDeliveryType:(NSNumber *)deliveryType
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", deliveryType, CFSTR("kMDItemDeliveryType"));
}

- (NSNumber)deliveryType
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemDeliveryType"));
}

- (void)setAlbum:(NSString *)album
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", album, CFSTR("kMDItemAlbum"));
}

- (NSString)album
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAlbum"));
}

- (void)setArtist:(NSString *)artist
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", artist, CFSTR("kMDItemArtist"));
}

- (NSString)artist
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemArtist"));
}

- (void)setHasAlphaChannel:(NSNumber *)hasAlphaChannel
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", hasAlphaChannel, CFSTR("kMDItemHasAlphaChannel"));
}

- (NSNumber)hasAlphaChannel
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemHasAlphaChannel"));
}

- (void)setRedEyeOn:(NSNumber *)redEyeOn
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", redEyeOn, CFSTR("kMDItemRedEyeOnOff"));
}

- (NSNumber)isRedEyeOn
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemRedEyeOnOff"));
}

- (void)setMeteringMode:(NSString *)meteringMode
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", meteringMode, CFSTR("kMDItemMeteringMode"));
}

- (NSString)meteringMode
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemMeteringMode"));
}

- (void)setMaxAperture:(NSNumber *)maxAperture
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", maxAperture, CFSTR("kMDItemMaxAperture"));
}

- (NSNumber)maxAperture
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemMaxAperture"));
}

- (void)setFNumber:(NSNumber *)fNumber
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", fNumber, CFSTR("kMDItemFNumber"));
}

- (NSNumber)fNumber
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemFNumber"));
}

- (void)setExposureProgram:(NSString *)exposureProgram
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", exposureProgram, CFSTR("kMDItemExposureProgram"));
}

- (NSString)exposureProgram
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemExposureProgram"));
}

- (void)setExposureTimeString:(NSString *)exposureTimeString
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", exposureTimeString, CFSTR("kMDItemExposureTimeString"));
}

- (NSString)exposureTimeString
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemExposureTimeString"));
}

- (void)setHeadline:(NSString *)headline
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", headline, CFSTR("kMDItemHeadline"));
}

- (NSString)headline
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemHeadline"));
}

- (void)setInstructions:(NSString *)instructions
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", instructions, CFSTR("kMDItemInstructions"));
}

- (NSString)instructions
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemInstructions"));
}

- (void)setThoroughfare:(NSString *)thoroughfare
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", thoroughfare, CFSTR("kMDItemThoroughfare"));
}

- (NSString)thoroughfare
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemThoroughfare"));
}

- (void)setSubThoroughfare:(NSString *)subThoroughfare
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", subThoroughfare, CFSTR("kMDItemSubThoroughfare"));
}

- (NSString)subThoroughfare
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemSubThoroughfare"));
}

- (void)setPostalCode:(NSString *)postalCode
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", postalCode, CFSTR("kMDItemPostalCode"));
}

- (NSString)postalCode
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPostalCode"));
}

- (void)setCity:(NSString *)city
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", city, CFSTR("kMDItemCity"));
}

- (NSString)city
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemCity"));
}

- (void)setStateOrProvince:(NSString *)stateOrProvince
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", stateOrProvince, CFSTR("kMDItemStateOrProvince"));
}

- (NSString)stateOrProvince
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemStateOrProvince"));
}

- (void)setCountry:(NSString *)country
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", country, CFSTR("kMDItemCountry"));
}

- (NSString)country
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemCountry"));
}

- (void)setFullyFormattedAddress:(NSString *)fullyFormattedAddress
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", fullyFormattedAddress, CFSTR("kMDItemFullyFormattedAddress"));
}

- (NSString)fullyFormattedAddress
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemFullyFormattedAddress"));
}

- (void)setAltitude:(NSNumber *)altitude
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", altitude, CFSTR("kMDItemAltitude"));
}

- (NSNumber)altitude
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAltitude"));
}

- (void)setLatitude:(NSNumber *)latitude
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", latitude, CFSTR("kMDItemLatitude"));
}

- (NSNumber)latitude
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemLatitude"));
}

- (void)setLongitude:(NSNumber *)longitude
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", longitude, CFSTR("kMDItemLongitude"));
}

- (NSNumber)longitude
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemLongitude"));
}

- (void)setSupportsNavigation:(NSNumber *)supportsNavigation
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", supportsNavigation, CFSTR("kMDItemSupportsNavigation"));
}

- (NSNumber)supportsNavigation
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemSupportsNavigation"));
}

- (void)setActionIdentifiers:(NSArray *)actionIdentifiers
{
  NSArray *v4;

  v4 = actionIdentifiers;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemActionIdentifiers"));

}

- (NSArray)actionIdentifiers
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemActionIdentifiers"));
}

- (void)setSharedItemContentType:(UTType *)sharedItemContentType
{
  id v4;

  -[UTType identifier](sharedItemContentType, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", v4, CFSTR("kMDItemSharedItemContentType"));

}

- (UTType)sharedItemContentType
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CEC3F8];
  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemSharedItemContentType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UTType *)v4;
}

- (void)setSpeed:(NSNumber *)speed
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", speed, CFSTR("kMDItemSpeed"));
}

- (NSNumber)speed
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemSpeed"));
}

- (void)setTimestamp:(NSDate *)timestamp
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", timestamp, CFSTR("kMDItemTimestamp"));
}

- (NSDate)timestamp
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemTimestamp"));
}

- (void)setImageDirection:(NSNumber *)imageDirection
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", imageDirection, CFSTR("kMDItemImageDirection"));
}

- (NSNumber)imageDirection
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemImageDirection"));
}

- (void)setNamedLocation:(NSString *)namedLocation
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", namedLocation, CFSTR("kMDItemNamedLocation"));
}

- (NSString)namedLocation
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemNamedLocation"));
}

- (void)setGPSTrack:(NSNumber *)GPSTrack
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", GPSTrack, CFSTR("kMDItemGPSTrack"));
}

- (NSNumber)GPSTrack
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemGPSTrack"));
}

- (void)setGPSStatus:(NSString *)GPSStatus
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", GPSStatus, CFSTR("kMDItemGPSStatus"));
}

- (NSString)GPSStatus
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemGPSStatus"));
}

- (void)setGPSMeasureMode:(NSString *)GPSMeasureMode
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", GPSMeasureMode, CFSTR("kMDItemGPSMeasureMode"));
}

- (NSString)GPSMeasureMode
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemGPSMeasureMode"));
}

- (void)setGPSDOP:(NSNumber *)GPSDOP
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", GPSDOP, CFSTR("kMDItemGPSDOP"));
}

- (NSNumber)GPSDOP
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemGPSDOP"));
}

- (void)setGPSMapDatum:(NSString *)GPSMapDatum
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", GPSMapDatum, CFSTR("kMDItemGPSMapDatum"));
}

- (NSString)GPSMapDatum
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemGPSMapDatum"));
}

- (void)setGPSDestLatitude:(NSNumber *)GPSDestLatitude
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", GPSDestLatitude, CFSTR("kMDItemGPSDestLatitude"));
}

- (NSNumber)GPSDestLatitude
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemGPSDestLatitude"));
}

- (void)setGPSDestLongitude:(NSNumber *)GPSDestLongitude
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", GPSDestLongitude, CFSTR("kMDItemGPSDestLongitude"));
}

- (NSNumber)GPSDestLongitude
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemGPSDestLongitude"));
}

- (void)setGPSDestBearing:(NSNumber *)GPSDestBearing
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", GPSDestBearing, CFSTR("kMDItemGPSDestBearing"));
}

- (NSNumber)GPSDestBearing
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemGPSDestBearing"));
}

- (void)setGPSDestDistance:(NSNumber *)GPSDestDistance
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", GPSDestDistance, CFSTR("kMDItemGPSDestDistance"));
}

- (NSNumber)GPSDestDistance
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemGPSDestDistance"));
}

- (void)setGPSProcessingMethod:(NSString *)GPSProcessingMethod
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", GPSProcessingMethod, CFSTR("kMDItemGPSProcessingMethod"));
}

- (NSString)GPSProcessingMethod
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemGPSProcessingMethod"));
}

- (void)setGPSAreaInformation:(NSString *)GPSAreaInformation
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", GPSAreaInformation, CFSTR("kMDItemGPSAreaInformation"));
}

- (NSString)GPSAreaInformation
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemGPSAreaInformation"));
}

- (void)setGPSDateStamp:(NSDate *)GPSDateStamp
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", GPSDateStamp, CFSTR("kMDItemGPSDateStamp"));
}

- (NSDate)GPSDateStamp
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemGPSDateStamp"));
}

- (void)setGPSDifferental:(NSNumber *)GPSDifferental
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", GPSDifferental, CFSTR("kMDItemGPSDifferental"));
}

- (NSNumber)GPSDifferental
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemGPSDifferental"));
}

- (void)setAudioSampleRate:(NSNumber *)audioSampleRate
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", audioSampleRate, CFSTR("kMDItemAudioSampleRate"));
}

- (NSNumber)audioSampleRate
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAudioSampleRate"));
}

- (void)setAudioChannelCount:(NSNumber *)audioChannelCount
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", audioChannelCount, CFSTR("kMDItemAudioChannelCount"));
}

- (NSNumber)audioChannelCount
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAudioChannelCount"));
}

- (void)setTempo:(NSNumber *)tempo
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", tempo, CFSTR("kMDItemTempo"));
}

- (NSNumber)tempo
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemTempo"));
}

- (void)setKeySignature:(NSString *)keySignature
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", keySignature, CFSTR("kMDItemKeySignature"));
}

- (NSString)keySignature
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemKeySignature"));
}

- (void)setTimeSignature:(NSString *)timeSignature
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", timeSignature, CFSTR("kMDItemTimeSignature"));
}

- (NSString)timeSignature
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemTimeSignature"));
}

- (void)setAudioEncodingApplication:(NSString *)audioEncodingApplication
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", audioEncodingApplication, CFSTR("kMDItemAudioEncodingApplication"));
}

- (NSString)audioEncodingApplication
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAudioEncodingApplication"));
}

- (void)setComposer:(NSString *)composer
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", composer, CFSTR("kMDItemComposer"));
}

- (NSString)composer
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemComposer"));
}

- (void)setLyricist:(NSString *)lyricist
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", lyricist, CFSTR("kMDItemLyricist"));
}

- (NSString)lyricist
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemLyricist"));
}

- (void)setAudioTrackNumber:(NSNumber *)audioTrackNumber
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", audioTrackNumber, CFSTR("kMDItemAudioTrackNumber"));
}

- (NSNumber)audioTrackNumber
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAudioTrackNumber"));
}

- (void)setRecordingDate:(NSDate *)recordingDate
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", recordingDate, CFSTR("kMDItemRecordingDate"));
}

- (NSDate)recordingDate
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemRecordingDate"));
}

- (void)setMusicalGenre:(NSString *)musicalGenre
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", musicalGenre, CFSTR("kMDItemMusicalGenre"));
}

- (NSString)musicalGenre
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemMusicalGenre"));
}

- (void)setGeneralMIDISequence:(NSNumber *)generalMIDISequence
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", generalMIDISequence, CFSTR("kMDItemIsGeneralMIDISequence"));
}

- (NSNumber)isGeneralMIDISequence
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemIsGeneralMIDISequence"));
}

- (void)setOrganizations:(NSArray *)organizations
{
  NSArray *v4;

  v4 = organizations;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemOrganizations"));

}

- (NSArray)organizations
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemOrganizations"));
}

- (void)setRole:(NSString *)role
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", role, CFSTR("kMDItemRole"));
}

- (NSString)role
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemRole"));
}

- (void)setLanguages:(NSArray *)languages
{
  NSArray *v4;

  v4 = languages;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemLanguages"));

}

- (NSArray)languages
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemLanguages"));
}

- (void)setRights:(NSString *)rights
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", rights, CFSTR("kMDItemRights"));
}

- (NSString)rights
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemRights"));
}

- (void)setPublishers:(NSArray *)publishers
{
  NSArray *v4;

  v4 = publishers;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemPublishers"));

}

- (NSArray)publishers
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPublishers"));
}

- (void)setContributors:(NSArray *)contributors
{
  NSArray *v4;

  v4 = contributors;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemContributors"));

}

- (NSArray)contributors
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemContributors"));
}

- (void)setCoverage:(NSArray *)coverage
{
  NSArray *v4;

  v4 = coverage;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemCoverage"));

}

- (NSArray)coverage
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemCoverage"));
}

- (NSString)subject
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemSubject"));
}

- (NSString)theme
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemTheme"));
}

- (NSString)contentDescription
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemDescription"));
}

- (NSString)identifier
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemIdentifier"));
}

- (void)setAudiences:(NSArray *)audiences
{
  NSArray *v4;

  v4 = audiences;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemAudiences"));

}

- (NSArray)audiences
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAudiences"));
}

- (void)setPageCount:(NSNumber *)pageCount
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", pageCount, CFSTR("kMDItemNumberOfPages"));
}

- (NSNumber)pageCount
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemNumberOfPages"));
}

- (void)setFileSize:(NSNumber *)fileSize
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", fileSize, CFSTR("kMDItemFileSize"));
}

- (void)setPageWidth:(NSNumber *)pageWidth
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", pageWidth, CFSTR("kMDItemPageWidth"));
}

- (NSNumber)pageWidth
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPageWidth"));
}

- (void)setPageHeight:(NSNumber *)pageHeight
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", pageHeight, CFSTR("kMDItemPageHeight"));
}

- (NSNumber)pageHeight
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPageHeight"));
}

- (void)setSecurityMethod:(NSString *)securityMethod
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", securityMethod, CFSTR("kMDItemSecurityMethod"));
}

- (NSString)securityMethod
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemSecurityMethod"));
}

- (void)setCreator:(NSString *)creator
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", creator, CFSTR("kMDItemCreator"));
}

- (NSString)creator
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemCreator"));
}

- (void)setEncodingApplications:(NSArray *)encodingApplications
{
  NSArray *v4;

  v4 = encodingApplications;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemEncodingApplications"));

}

- (NSArray)encodingApplications
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEncodingApplications"));
}

- (void)setDueDate:(NSDate *)dueDate
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", dueDate, CFSTR("kMDItemDueDate"));
}

- (NSDate)dueDate
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemDueDate"));
}

- (void)setCompletionDate:(NSDate *)completionDate
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", completionDate, CFSTR("kMDItemCompletionDate"));
}

- (NSDate)completionDate
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemCompletionDate"));
}

- (void)setStartDate:(NSDate *)startDate
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", startDate, CFSTR("kMDItemStartDate"));
}

- (NSDate)startDate
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemStartDate"));
}

- (void)setEndDate:(NSDate *)endDate
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", endDate, CFSTR("kMDItemEndDate"));
}

- (NSDate)endDate
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEndDate"));
}

- (void)setImportantDates:(NSArray *)importantDates
{
  NSArray *v4;

  v4 = importantDates;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemImportantDates"));

}

- (NSArray)importantDates
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemImportantDates"));
}

- (void)setRating:(NSNumber *)rating
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", rating, CFSTR("kMDItemStarRating"));
}

- (NSNumber)rating
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemStarRating"));
}

- (void)setRatingDescription:(NSString *)ratingDescription
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", ratingDescription, CFSTR("kMDItemRatingDescription"));
}

- (NSString)ratingDescription
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemRatingDescription"));
}

- (void)setPlayCount:(NSNumber *)playCount
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", playCount, CFSTR("kMDItemPlayCount"));
}

- (NSNumber)playCount
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPlayCount"));
}

- (void)setLocal:(NSNumber *)local
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", local, CFSTR("kMDItemIsLocal"));
}

- (NSNumber)isLocal
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemIsLocal"));
}

- (void)setContentRating:(NSNumber *)contentRating
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", contentRating, CFSTR("kMDItemContentRating"));
}

- (NSNumber)contentRating
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemContentRating"));
}

- (void)setPhoneNumbers:(NSArray *)phoneNumbers
{
  NSArray *v4;

  v4 = phoneNumbers;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemPhoneNumbers"));

}

- (NSArray)phoneNumbers
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhoneNumbers"));
}

- (void)setSupportsPhoneCall:(NSNumber *)supportsPhoneCall
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", supportsPhoneCall, CFSTR("kMDItemSupportsPhoneCall"));
}

- (NSNumber)supportsPhoneCall
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemSupportsPhoneCall"));
}

- (void)setEmailAddresses:(NSArray *)emailAddresses
{
  NSArray *v4;

  v4 = emailAddresses;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemEmailAddresses"));

}

- (void)setInstantMessageAddresses:(NSArray *)instantMessageAddresses
{
  NSArray *v4;

  v4 = instantMessageAddresses;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemInstantMessageAddresses"));

}

- (NSArray)instantMessageAddresses
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemInstantMessageAddresses"));
}

- (void)setPotentialEventMessage:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("_kMDItemPotentialEventMessage"));
}

- (NSNumber)isPotentialEventMessage
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemPotentialEventMessage"));
}

- (void)setKind:(NSString *)kind
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", kind, CFSTR("kMDItemKind"));
}

- (NSString)kind
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemKind"));
}

- (void)setFinderComment:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemFinderComment"));
}

- (id)finderComment
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemFinderComment"));
}

- (void)setCalendarHolidayIdentifier:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemCalendarHolidayIdentifier"));
}

- (id)calendarHolidayIdentifier
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemCalendarHolidayIdentifier"));
}

- (void)setFontNames:(NSArray *)fontNames
{
  NSArray *v4;

  v4 = fontNames;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemFonts"));

}

- (NSArray)fontNames
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemFonts"));
}

- (void)setAppleLoopsRootKey:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemAppleLoopsRootKey"));
}

- (id)appleLoopsRootKey
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAppleLoopsRootKey"));
}

- (void)setAppleLoopsKeyFilterType:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemAppleLoopsKeyFilterType"));
}

- (id)appleLoopsKeyFilterType
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAppleLoopsKeyFilterType"));
}

- (void)setAppleLoopsLoopMode:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemAppleLoopsLoopMode"));
}

- (id)appleLoopsLoopMode
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAppleLoopsLoopMode"));
}

- (void)setAppleLoopDescriptors:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemAppleLoopDescriptors"));

}

- (id)appleLoopDescriptors
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAppleLoopDescriptors"));
}

- (void)setMusicalInstrumentCategory:(NSString *)musicalInstrumentCategory
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", musicalInstrumentCategory, CFSTR("kMDItemMusicalInstrumentCategory"));
}

- (NSString)musicalInstrumentCategory
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemMusicalInstrumentCategory"));
}

- (void)setMusicalInstrumentName:(NSString *)musicalInstrumentName
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", musicalInstrumentName, CFSTR("kMDItemMusicalInstrumentName"));
}

- (NSString)musicalInstrumentName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemMusicalInstrumentName"));
}

- (void)setBundleIdentifier:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemBundleIdentifier"));
}

- (id)bundleIdentifier
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemBundleIdentifier"));
}

- (void)setExecutableArchitectures:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemExecutableArchitectures"));

}

- (id)executableArchitectures
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemExecutableArchitectures"));
}

- (void)setExecutablePlatform:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemExecutablePlatform"));
}

- (id)executablePlatform
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemExecutablePlatform"));
}

- (void)setVendorName:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemVendorName"));
}

- (id)vendorName
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemVendorName"));
}

- (void)setApplicationCategories:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemApplicationCategories"));

}

- (id)applicationCategories
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemApplicationCategories"));
}

- (void)setApplicationManaged:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("kMDItemIsApplicationManaged"));
}

- (id)isApplicationManaged
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemIsApplicationManaged"));
}

- (void)setSupportFileType:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemSupportFileType"));

}

- (id)supportFileType
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemSupportFileType"));
}

- (void)setInformation:(NSString *)information
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", information, CFSTR("kMDItemInformation"));
}

- (NSString)information
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemInformation"));
}

- (void)setDirector:(NSString *)director
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", director, CFSTR("kMDItemDirector"));
}

- (NSString)director
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemDirector"));
}

- (void)setProducer:(NSString *)producer
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", producer, CFSTR("kMDItemProducer"));
}

- (NSString)producer
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemProducer"));
}

- (void)setGenre:(NSString *)genre
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", genre, CFSTR("kMDItemGenre"));
}

- (NSString)genre
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemGenre"));
}

- (void)setPerformers:(NSArray *)performers
{
  NSArray *v4;

  v4 = performers;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemPerformers"));

}

- (NSArray)performers
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPerformers"));
}

- (void)setOriginalFormat:(NSString *)originalFormat
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", originalFormat, CFSTR("kMDItemOriginalFormat"));
}

- (NSString)originalFormat
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemOriginalFormat"));
}

- (void)setOriginalSource:(NSString *)originalSource
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", originalSource, CFSTR("kMDItemOriginalSource"));
}

- (NSString)originalSource
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemOriginalSource"));
}

- (void)setURL:(NSURL *)URL
{
  -[CSSearchableItemAttributeSet _setURLValue:forKey:](self, "_setURLValue:forKey:", URL, CFSTR("kMDItemURL"));
}

- (NSURL)URL
{
  void *v2;
  id v3;
  void *v4;

  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemURL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
LABEL_7:

  return (NSURL *)v4;
}

- (void)setLikelyJunk:(NSNumber *)likelyJunk
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", likelyJunk, CFSTR("kMDItemIsLikelyJunk"));
}

- (NSNumber)isLikelyJunk
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemIsLikelyJunk"));
}

- (void)setProviderDataTypes:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("_kMDItemProviderDataTypes"));

}

- (id)providerDataTypes
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemProviderDataTypes"));
}

- (void)setProviderFileTypes:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("_kMDItemProviderFileTypes"));

}

- (id)providerFileTypes
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemProviderFileTypes"));
}

- (void)setProviderDataTypeIdentifiers:(NSArray *)providerDataTypeIdentifiers
{
  NSArray *v4;

  v4 = providerDataTypeIdentifiers;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("_kMDItemProviderDataTypes"));

}

- (NSArray)providerDataTypeIdentifiers
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemProviderDataTypes"));
}

- (void)setProviderFileTypeIdentifiers:(NSArray *)providerFileTypeIdentifiers
{
  NSArray *v4;

  v4 = providerFileTypeIdentifiers;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("_kMDItemProviderFileTypes"));

}

- (NSArray)providerFileTypeIdentifiers
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemProviderFileTypes"));
}

- (void)setProviderInPlaceFileTypeIdentifiers:(NSArray *)providerInPlaceFileTypeIdentifiers
{
  NSArray *v4;

  v4 = providerInPlaceFileTypeIdentifiers;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("_MDItemProviderInPlaceFileTypes"));

}

- (NSArray)providerInPlaceFileTypeIdentifiers
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_MDItemProviderInPlaceFileTypes"));
}

- (void)setCalendarDelegateIdentifier:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemCalendarDelegateIdentifier"));
}

- (id)calendarDelegateIdentifier
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemCalendarDelegateIdentifier"));
}

- (void)setAuthorPhotosPersonIdentifiers:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemAuthorPhotosPersonIdentifiers"));

}

- (NSArray)authorPhotosPersonIdentifiers
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAuthorPhotosPersonIdentifiers"));
}

- (void)setRecipientPhotosPersonIdentifiers:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemRecipientPhotosPersonIdentifiers"));

}

- (NSArray)recipientPhotosPersonIdentifiers
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemRecipientPhotosPersonIdentifiers"));
}

- (void)setCollaborationIdentifier:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("_kMDItemCollaborationIdentifier"));
}

- (NSString)collaborationIdentifier
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemCollaborationIdentifier"));
}

- (void)setRichLinkTitle:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemRichLinkTitle"));
}

- (NSString)richLinkTitle
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemRichLinkTitle"));
}

- (void)setRichLinkID:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("_kMDItemRichLinkID"));
}

- (NSString)richLinkID
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemRichLinkID"));
}

- (void)setRichLinkURL:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("_kMDItemRichLinkURL"));
}

- (NSString)richLinkURL
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemRichLinkURL"));
}

- (void)setThumbnailSymbolName:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("_kMDItemThumbnailSymbolName"));
}

- (NSString)thumbnailSymbolName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemThumbnailSymbolName"));
}

- (NSArray)resultMatchingAttributes
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDQueryResultMatchingAttributes"));
}

- (NSArray)resultMatchingSceneIdentifiers
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDQueryResultMatchingSceneIdentifiers"));
}

- (NSData)HTMLContentDataNoCopy
{
  void *v3;
  CSDecoder *contentDecoder;
  __int128 v6;
  $37FF168C8709F524D812460C59637AB1 reference;

  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemHTMLContentData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (self->_contentDecoder
      && (v6 = *(_OWORD *)&self->_contentObj.containerBytes,
          reference = self->_contentObj.reference,
          _MDPlistGetPlistObjectType() == 246))
    {
      contentDecoder = self->_contentDecoder;
      v6 = *(_OWORD *)&self->_contentObj.containerBytes;
      reference = self->_contentObj.reference;
      -[CSDecoder decodeObjectNoCopy:](contentDecoder, "decodeObjectNoCopy:", &v6);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  return (NSData *)v3;
}

- (NSString)textContentNoCopy
{
  void *v3;
  $70FB98EE0919CC727AB8FBF44F6186F7 *p_contentObj;
  CSDecoder *contentDecoder;
  __int128 v7;
  $37FF168C8709F524D812460C59637AB1 reference;

  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemTextContent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (self->_contentDecoder
      && ((p_contentObj = &self->_contentObj,
           v7 = *(_OWORD *)&self->_contentObj.containerBytes,
           reference = self->_contentObj.reference,
           _MDPlistGetPlistObjectType() == 244)
       || (v7 = *(_OWORD *)&p_contentObj->containerBytes,
           reference = self->_contentObj.reference,
           _MDPlistGetPlistObjectType() == 245)))
    {
      contentDecoder = self->_contentDecoder;
      v7 = *(_OWORD *)&p_contentObj->containerBytes;
      reference = self->_contentObj.reference;
      -[CSDecoder decodeObjectNoCopy:](contentDecoder, "decodeObjectNoCopy:", &v7);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  return (NSString *)v3;
}

- (void)setDeletedWithRelatedUniqueIdentifier:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("_MDItemDeletedWithRelatedUniqueIdentifier"));
}

- (NSNumber)deletedWithRelatedUniqueIdentifier
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_MDItemDeletedWithRelatedUniqueIdentifier"));
}

- (void)setAccountType:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemAccountType"));
}

- (NSString)accountType
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAccountType"));
}

- (void)setTextSelected:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemTextSelected"));
}

- (NSString)textSelected
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemTextSelected"));
}

- (NSString)subtitle
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemSubtitle"));
}

- (void)setUserTags:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemUserTags"));

}

- (void)setAlbumPersistentID:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemAlbumPersistentID"));
}

- (NSString)albumPersistentID
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAlbumPersistentID"));
}

- (void)setAdamID:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemAdamID"));
}

- (NSString)adamID
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAdamID"));
}

- (void)setExtendedContentRating:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("kMDItemExtendedContentRating"));
}

- (NSNumber)extendedContentRating
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemExtendedContentRating"));
}

- (void)setFileIdentifier:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("kMDItemFileIdentifier"));
}

- (NSNumber)fileIdentifier
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemFileIdentifier"));
}

- (void)setParentFileIdentifier:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("kMDItemParentFileIdentifier"));
}

- (NSNumber)parentFileIdentifier
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemParentFileIdentifier"));
}

- (void)setFilename:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemFilename"));
}

- (NSString)filename
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemFilename"));
}

- (void)setDocumentIdentifier:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("kMDItemDocumentIdentifier"));
}

- (NSNumber)documentIdentifier
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemDocumentIdentifier"));
}

- (void)setDataOwnerType:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("kMDItemDataOwnerType"));
}

- (NSNumber)dataOwnerType
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemDataOwnerType"));
}

- (void)setExistingThread:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("kMDItemIsExistingThread"));
}

- (NSNumber)isExistingThread
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemIsExistingThread"));
}

- (void)setPartiallyDownloaded:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("kMDItemIsPartiallyDownloaded"));
}

- (NSNumber)isPartiallyDownloaded
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemIsPartiallyDownloaded"));
}

- (void)setQueryResultMatchedFields:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:](self, "_setValue:withClass:forKey:", v4, objc_opt_class(), CFSTR("kMDQueryResultMatchedFields"));

}

- (NSArray)queryResultMatchedFields
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDQueryResultMatchedFields"));
}

- (void)setDisableSearchInSpotlight:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemDisableSearchInSpotlight"), 0);

}

- (NSNumber)disableSearchInSpotlight
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemDisableSearchInSpotlight"));
}

- (NSNumber)contentCreationDateHour
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemContentCreationDateHour"));
}

- (NSNumber)contentCreationDateDay
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemContentCreationDateDay"));
}

- (NSNumber)contentCreationDateMonth
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemContentCreationDateMonth"));
}

- (NSNumber)contentCreationDateYear
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemContentCreationDateYear"));
}

- (NSNumber)contentCreationDateWeekday
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemContentCreationDateWeekday"));
}

- (NSNumber)contentCreationDateWeekdayOrdinal
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemContentCreationDateWeekdayOrdinal"));
}

- (NSNumber)contentCreationDateWeekOfMonth
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemContentCreationDateWeekOfMonth"));
}

- (NSNumber)contentCreationDateWeekOfYear
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemContentCreationDateWeekOfYear"));
}

- (NSNumber)contentModificationDateHour
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemContentModificationDateHour"));
}

- (NSNumber)contentModificationDateDay
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemContentModificationDateDay"));
}

- (NSNumber)contentModificationDateMonth
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemContentModificationDateMonth"));
}

- (NSNumber)contentModificationDateYear
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemContentModificationDateYear"));
}

- (NSNumber)contentModificationDateWeekday
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemContentModificationDateWeekday"));
}

- (NSNumber)contentModificationDateWeekdayOrdinal
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemContentModificationDateWeekdayOrdinal"));
}

- (NSNumber)contentModificationDateWeekOfMonth
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemContentModificationDateWeekOfMonth"));
}

- (NSNumber)contentModificationDateWeekOfYear
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemContentModificationDateWeekOfYear"));
}

- (void)setSummarizedIdentifiers:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("_kMDItemSummarizedIdentifiers"));

}

- (NSArray)summarizedIdentifiers
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemSummarizedIdentifiers"));
}

- (void)setIsNew:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemIsNew"), 0);

}

- (NSNumber)isNew
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemIsNew"));
}

- (void)setIsTwoFactorCode:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemIsTwoFactorCode"), 0);

}

- (NSNumber)isTwoFactorCode
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemIsTwoFactorCode"));
}

- (void)setIsFromMe:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemIsFromMe"), 0);

}

- (NSNumber)isFromMe
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemIsFromMe"));
}

- (void)setIsGroupThread:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemIsGroupThread"), 0);

}

- (NSNumber)isGroupThread
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemIsGroupThread"));
}

- (void)setRequiresMediaAnalysis:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemRequiresMediaAnalysis"), 0);

}

- (NSNumber)requiresMediaAnalysis
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemRequiresMediaAnalysis"));
}

- (void)setMediaAnalysisComplete:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemMediaAnalysisComplete"), 0);

}

- (NSNumber)mediaAnalysisComplete
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemMediaAnalysisComplete"));
}

- (void)setSummarizationContentTopLine:(id)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[CSSearchableItemAttributeSet _setDataValue:forKey:](self, "_setDataValue:forKey:", v4, CFSTR("_kMDItemSummarizationContentTopLine"));

}

- (NSAttributedString)summarizationContentTopLine
{
  void *v2;
  void *v3;

  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemSummarizationContentTopLine"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (void)setSummarizationContentSynopsis:(id)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[CSSearchableItemAttributeSet _setDataValue:forKey:](self, "_setDataValue:forKey:", v4, CFSTR("_kMDItemSummarizationContentSynopsis"));

}

- (NSAttributedString)summarizationContentSynopsis
{
  void *v2;
  void *v3;

  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemSummarizationContentSynopsis"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (void)setSummarizationContentTopic:(id)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[CSSearchableItemAttributeSet _setDataValue:forKey:](self, "_setDataValue:forKey:", v4, CFSTR("_kMDItemSummarizationContentTopic"));

}

- (NSAttributedString)summarizationContentTopic
{
  void *v2;
  void *v3;

  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemSummarizationContentTopic"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (void)setSummarizationStatus:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", v4, CFSTR("_kMDItemSummarizationStatus"));

}

- (int)summarizationStatus
{
  void *v2;
  int v3;

  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemSummarizationStatus"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (void)setUrgencyStatus:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", v4, CFSTR("_kMDItemUrgencyStatus"));

}

- (int)urgencyStatus
{
  void *v2;
  int v3;

  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemUrgencyStatus"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (void)setSmartRepliesResponse:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet _setDataValue:forKey:](self, "_setDataValue:forKey:", v4, CFSTR("_kMDItemSmartRepliesResponse"));

}

- (CSSmartRepliesResponse)smartRepliesResponse
{
  void *v2;
  void *v3;

  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemSmartRepliesResponse"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CSSmartRepliesResponse *)v3;
}

- (void)setSmartRepliesStatus:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", v4, CFSTR("_kMDItemSmartRepliesStatus"));

}

- (int)smartRepliesStatus
{
  void *v2;
  int v3;

  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemSmartRepliesStatus"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (void)setBundleID:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("_kMDItemBundleID"));
}

- (void)setProtectionClass:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("_kMDItemProtectionClass"));
}

- (NSString)applicationName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemApplicationName"));
}

- (NSString)contentSnippet
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemSnippet"));
}

- (void)setQueryResultRelevance:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDQueryResultMenuRelevance"));
}

- (NSString)queryResultRelevance
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDQueryResultMenuRelevance"));
}

- (void)setRelatedAppBundleIdentifier:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemRelatedAppBundleIdentifier"));
}

- (NSString)relatedAppBundleIdentifier
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemRelatedAppBundleIdentifier"));
}

- (void)setHashtags:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemHashtags"));

}

- (NSArray)hashtags
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemHashtags"));
}

- (void)setHasLPMedia:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("kMDItemHasLPMedia"));
}

- (NSNumber)hasLPMedia
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemHasLPMedia"));
}

- (void)setLPMediaPaths:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemLPMediaPaths"));

}

- (NSArray)LPMediaPaths
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemLPMediaPaths"));
}

- (void)setGroupPhotoPath:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemGroupPhotoPath"));
}

- (NSString)groupPhotoPath
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemGroupPhotoPath"));
}

- (void)setSyndicationStatus:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("com_apple_mobilesms_isHighlightedContent"));
}

- (NSNumber)syndicationStatus
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("com_apple_mobilesms_isHighlightedContent"));
}

- (void)setSyndicatedContentServerDate:(id)a3
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", a3, CFSTR("kMDItemSyndicatedContentServerDate"));
}

- (NSDate)syndicatedContentServerDate
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemSyndicatedContentServerDate"));
}

- (void)setRequiresImport:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("_kMDItemRequiresImport"));
}

- (void)setImportSandboxExtension:(id)a3
{
  uint64_t v5;

  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("_kMDItemImportSandboxExtension"));
  if (a3)
    v5 = MEMORY[0x1E0C9AAB0];
  else
    v5 = 0;
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", v5, CFSTR("_kMDItemImportHasSandboxExtension"));
}

- (NSString)importSandboxExtension
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemImportSandboxExtension"));
}

- (void)setVisualAssetPriority:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("_kMDItemVisualAssetPriority"));
}

- (NSNumber)visualAssetPriority
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemVisualAssetPriority"));
}

- (void)setDetectedEventTypes:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemDetectedEventTypes"));

}

- (NSArray)detectedEventTypes
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemDetectedEventTypes"));
}

- (void)_standardizeProcessorAttributesForBundle:(id)a3 protectionClass:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v8 = (void *)getSKGAttributeProcessorClass_softClass;
  v20 = getSKGAttributeProcessorClass_softClass;
  if (!getSKGAttributeProcessorClass_softClass)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __getSKGAttributeProcessorClass_block_invoke;
    v16[3] = &unk_1E2401140;
    v16[4] = &v17;
    __getSKGAttributeProcessorClass_block_invoke((uint64_t)v16);
    v8 = (void *)v18[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v17, 8);
  if (v9)
  {
    objc_msgSend(v9, "sharedProcessor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      objc_msgSend(v9, "sharedProcessor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSSearchableItemAttributeSet mutableAttributes](self, "mutableAttributes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "processorAttributesForRecord:bundleID:protectionClass:", v13, v6, v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "count"))
      {
        -[CSSearchableItemAttributeSet mutableAttributes](self, "mutableAttributes");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addEntriesFromDictionary:", v14);

      }
    }
  }

}

- (void)setEventMessageIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventMessageIdentifier"), 1);

}

- (NSString)eventMessageIdentifier
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventMessageIdentifier"));
}

- (void)setEventGroupIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventGroupIdentifier"), 1);

}

- (NSString)eventGroupIdentifier
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventGroupIdentifier"));
}

- (void)setEventFallbackGroupIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFallbackGroupIdentifier"), 1);

}

- (NSString)eventFallbackGroupIdentifier
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFallbackGroupIdentifier"));
}

- (void)setEventMegadomeIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventMegadomeIdentifier"), 1);

}

- (NSString)eventMegadomeIdentifier
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventMegadomeIdentifier"));
}

- (void)setEventType:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventType"), 1);

}

- (NSString)eventType
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventType"));
}

- (void)setEventMetadata:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventMetadata"), 1);

}

- (NSString)eventMetadata
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventMetadata"));
}

- (void)setEventSourceMetadata:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventSourceMetadata"), 1);

}

- (NSString)eventSourceMetadata
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventSourceMetadata"));
}

- (void)setEventSourceBundleIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventSourceBundleIdentifier"), 1);

}

- (NSString)eventSourceBundleIdentifier
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventSourceBundleIdentifier"));
}

- (void)setEventIsAllDay:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventIsAllDay"), 0);

}

- (NSNumber)eventIsAllDay
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventIsAllDay"));
}

- (void)setEventSourceIsForwarded:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventSourceIsForwarded"), 0);

}

- (NSNumber)eventSourceIsForwarded
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventSourceIsForwarded"));
}

- (void)setSerialNumber:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemSerialNumber"), 0);

}

- (id)serialNumber
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemSerialNumber"));
}

- (void)setIndexIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemIndexIdentifier"), 1);

}

- (id)indexIdentifier
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemIndexIdentifier"));
}

- (void)setMediaAnalysisTimeRangeData:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemMediaAnalysTimeRangeData"), 0);

}

- (NSData)mediaAnalysisTimeRangeData
{
  return (NSData *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemMediaAnalysTimeRangeData"));
}

- (void)setPrimaryAccountNumberSuffix:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPrimaryAccountNumberSuffix"), 1);

}

- (NSString)primaryAccountNumberSuffix
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPrimaryAccountNumberSuffix"));
}

- (void)setCardNumberActionURL:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemCardNumberActionURL"), 0);

}

- (NSURL)cardNumberActionURL
{
  void *v2;
  id v3;
  void *v4;

  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemCardNumberActionURL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
LABEL_7:

  return (NSURL *)v4;
}

- (void)setPayBalanceActionURL:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPayBalanceActionURL"), 0);

}

- (NSURL)payBalanceActionURL
{
  void *v2;
  id v3;
  void *v4;

  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPayBalanceActionURL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
LABEL_7:

  return (NSURL *)v4;
}

- (void)setCardDetailsActionURL:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemCardDetailsActionURL"), 0);

}

- (NSURL)cardDetailsActionURL
{
  void *v2;
  id v3;
  void *v4;

  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemCardDetailsActionURL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
LABEL_7:

  return (NSURL *)v4;
}

- (void)setAttachmentCaptions:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemAttachmentCaptions"));

}

- (id)attachmentCaptions
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAttachmentCaptions"));
}

- (void)setAttachmentNames:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemAttachmentNames"));

}

- (id)attachmentNames
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAttachmentNames"));
}

- (void)setAttachmentTypes:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemAttachmentTypes"));

}

- (id)attachmentTypes
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAttachmentTypes"));
}

- (void)setAttachmentPaths:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemAttachmentPaths"));

}

- (id)attachmentPaths
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAttachmentPaths"));
}

- (void)setMailAttachmentNames:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("com_apple_mail_attachmentNames"));

}

- (NSArray)mailAttachmentNames
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("com_apple_mail_attachmentNames"));
}

- (void)setMailAttachmentTypes:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("com_apple_mail_attachmentTypes"));

}

- (NSArray)mailAttachmentTypes
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("com_apple_mail_attachmentTypes"));
}

- (void)setMailAttachmentKinds:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("com_apple_mail_attachmentKinds"));

}

- (NSArray)mailAttachmentKinds
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("com_apple_mail_attachmentKinds"));
}

- (void)setMailDateReceived:(id)a3
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", a3, CFSTR("com_apple_mail_dateReceived"));
}

- (NSDate)mailDateReceived
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("com_apple_mail_dateReceived"));
}

- (void)setMailDateLastViewed:(id)a3
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", a3, CFSTR("com_apple_mail_dateLastViewed"));
}

- (NSDate)mailDateLastViewed
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("com_apple_mail_dateLastViewed"));
}

- (void)setMailFlagged:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("com_apple_mail_flagged"));
}

- (NSNumber)mailFlagged
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("com_apple_mail_flagged"));
}

- (void)setMailFlagColor:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("com_apple_mail_flagColor"));
}

- (NSNumber)mailFlagColor
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("com_apple_mail_flagColor"));
}

- (void)setMailRead:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("com_apple_mail_read"));
}

- (NSNumber)mailRead
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("com_apple_mail_read"));
}

- (void)setMailRepliedTo:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("com_apple_mail_repliedTo"));
}

- (NSNumber)mailRepliedTo
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("com_apple_mail_repliedTo"));
}

- (void)setMailPriority:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("com_apple_mail_priority"));
}

- (NSNumber)mailPriority
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("com_apple_mail_priority"));
}

- (void)setMailGMailLabels:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("com_apple_mail_gmailLabels"));

}

- (NSArray)mailGMailLabels
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("com_apple_mail_gmailLabels"));
}

- (void)setMailMessageID:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("com_apple_mail_messageID"));
}

- (NSString)mailMessageID
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("com_apple_mail_messageID"));
}

- (void)setMailCategory:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemEmailCategory"));
}

- (NSString)mailCategory
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEmailCategory"));
}

- (void)setMailConversationID:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemEmailConversationID"));
}

- (NSString)mailConversationID
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEmailConversationID"));
}

- (void)setMailUseCount:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("kMDItemUseCount"));
}

- (NSNumber)mailUseCount
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUseCount"));
}

- (void)setMailResultScoreL1:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("kMDQueryResultScoreL1"));
}

- (NSNumber)mailResultScoreL1
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDQueryResultScoreL1"));
}

- (void)setMailResultScoreL2:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("kMDQueryResultScoreL2"));
}

- (NSNumber)mailResultScoreL2
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDQueryResultScoreL2"));
}

- (void)setMailUsedDates:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemUsedDates"));

}

- (NSArray)mailUsedDates
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUsedDates"));
}

- (void)setMailVIP:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemMailVIP"), 0);

}

- (NSNumber)mailVIP
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemMailVIP"));
}

- (void)setMailCategories:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemMailCategories"), 0);

}

- (int)mailCategories
{
  void *v2;
  int v3;

  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemMailCategories"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (void)setIsUrgent:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemIsUrgent"), 0);

}

- (NSNumber)isUrgent
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemIsUrgent"));
}

- (void)setEmailAutoReplied:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (v4 && objc_msgSend(v4, "BOOLValue"))
  {
    -[CSSearchableItemAttributeSet setAttribute:forKey:](self, "setAttribute:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("kMDMailMessageAutoReplied"));
  }
  else
  {
    -[CSSearchableItemAttributeSet mutableAttributes](self, "mutableAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("kMDMailMessageAutoReplied"));

  }
}

- (NSNumber)emailAutoReplied
{
  return (NSNumber *)-[CSSearchableItemAttributeSet attributeForKey:](self, "attributeForKey:", CFSTR("kMDMailMessageAutoReplied"));
}

- (void)setEmailHasDistributionListInTo:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (v4 && objc_msgSend(v4, "BOOLValue"))
  {
    -[CSSearchableItemAttributeSet setAttribute:forKey:](self, "setAttribute:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("kMDMailMessageHasDistributionListInTo"));
  }
  else
  {
    -[CSSearchableItemAttributeSet mutableAttributes](self, "mutableAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("kMDMailMessageHasDistributionListInTo"));

  }
}

- (NSNumber)emailHasDistributionListInTo
{
  return (NSNumber *)-[CSSearchableItemAttributeSet attributeForKey:](self, "attributeForKey:", CFSTR("kMDMailMessageHasDistributionListInTo"));
}

- (void)setEmailHasDistributionListInCC:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (v4 && objc_msgSend(v4, "BOOLValue"))
  {
    -[CSSearchableItemAttributeSet setAttribute:forKey:](self, "setAttribute:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("kMDMailMessageHasDistributionListInCC"));
  }
  else
  {
    -[CSSearchableItemAttributeSet mutableAttributes](self, "mutableAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("kMDMailMessageHasDistributionListInCC"));

  }
}

- (NSNumber)emailHasDistributionListInCC
{
  return (NSNumber *)-[CSSearchableItemAttributeSet attributeForKey:](self, "attributeForKey:", CFSTR("kMDMailMessageHasDistributionListInCC"));
}

- (void)setReaderView:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("kMDItemIsReaderView"));
}

- (NSNumber)isReaderView
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemIsReaderView"));
}

- (void)setTextContentDataSource:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemTextContentDataSource"));
}

- (NSString)textContentDataSource
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemTextContentDataSource"));
}

- (NSArray)autocompleteTriggers
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemAutocompleteTriggers"));
}

- (void)setAutocompleteTriggers:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("_kMDItemAutocompleteTriggers"));

}

- (void)setTabStatus:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemTabStatus"), 0);

}

- (NSNumber)tabStatus
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemTabStatus"));
}

- (void)setFileProviderID:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemFileProviderID"));
}

- (void)setFileItemID:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemFileItemID"));
}

- (NSString)fileItemID
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemFileItemID"));
}

- (void)setFPFilename:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("FPFilename"));
}

- (NSString)parentFileItemID
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemParentFileItemID"));
}

- (void)setParentFileItemID:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemParentFileItemID"));
}

- (void)setOwnerName:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemOwnerName"));
}

- (void)setOwnerIdentifier:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemOwnerIdentifier"));
}

- (NSString)ownerIdentifier
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemOwnerIdentifier"));
}

- (void)setLastEditorName:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemLastEditorName"));
}

- (void)setLastEditorIdentifier:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemLastEditorIdentifier"));
}

- (NSString)lastEditorIdentifier
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemOwnerIdentifier"));
}

- (void)setFileProviderDomainIdentifier:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("FPDomainIdentifier"));
}

- (void)setFileProviderUserInfoKeys:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("FPUserInfoKeys"));

}

- (NSArray)fileProviderUserInfoKeys
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("FPUserInfoKeys"));
}

- (void)setFileProviderUserInfoValues:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("FPUserInfoValues"));

}

- (NSArray)fileProviderUserInfoValues
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("FPUserInfoValues"));
}

- (void)setFileProviderOnDiskIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("FPOnDiskIdentifier"), 0);

}

- (NSNumber)fileProviderOnDiskIdentifier
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("FPOnDiskIdentifier"));
}

- (void)setTrashed:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemIsTrashed"), 0);

}

- (void)setShared:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemIsShared"), 0);

}

- (void)setPinned:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("FPItemIsPinned"), 0);

}

- (NSNumber)isPinned
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("FPItemIsPinned"));
}

- (void)setUploaded:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemIsUploaded"), 0);

}

- (void)setUploading:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemIsUploading"), 0);

}

- (void)setDownloading:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemIsDownloading"), 0);

}

- (void)setUploadError:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("kMDItemUploadError"));
}

- (NSNumber)uploadError
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUploadError"));
}

- (void)setDownloadError:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("kMDItemDownloadError"));
}

- (NSNumber)downloadError
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemDownloadError"));
}

- (void)setExtraData:(id)a3
{
  -[CSSearchableItemAttributeSet _setDataValue:forKey:](self, "_setDataValue:forKey:", a3, CFSTR("kMDItemExtraData"));
}

- (NSData)extraData
{
  return (NSData *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemExtraData"));
}

- (void)setFavoriteRank:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("kMDItemFavoriteRank"));
}

- (void)setSubItemCount:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("kMDItemSubItemCount"));
}

- (void)setSharedItemCurrentUserRole:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemSharedItemCurrentUserRole"));
}

- (NSString)sharedItemCurrentUserRole
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemSharedItemCurrentUserRole"));
}

- (void)setDownloadingStatus:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemDownloadingStatus"));
}

- (NSString)downloadingStatus
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemDownloadingStatus"));
}

- (void)setVersionIdentifier:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemVersionIdentifier"));
}

- (NSString)versionIdentifier
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemVersionIdentifier"));
}

- (id)userSharedSentSender
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUserSharedSentSender"));
}

- (id)userSharedSentSenderHandle
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUserSharedSentSenderHandle"));
}

- (id)userSharedSentRecipient
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUserSharedSentRecipient"));
}

- (id)userSharedSentRecipientHandle
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUserSharedSentRecipientHandle"));
}

- (id)userSharedSentTransport
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUserSharedSentTransport"));
}

- (id)userSharedReceivedSender
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUserSharedReceivedSender"));
}

- (id)userSharedReceivedSenderHandle
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUserSharedReceivedSenderHandle"));
}

- (id)userSharedReceivedRecipient
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUserSharedReceivedRecipient"));
}

- (id)userSharedReceivedRecipientHandle
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUserSharedReceivedRecipientHandle"));
}

- (id)userSharedReceivedTransport
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUserSharedReceivedTransport"));
}

- (id)userPrintedUserHandle
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUserPrintedUserHandle"));
}

- (id)userDownloadedUserHandle
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUserDownloadedUserHandle"));
}

- (id)userModifiedUserHandle
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUserModifiedUserHandle"));
}

- (id)userCreatedUserHandle
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemUserCreatedUserHandle"));
}

- (void)_markAs:(int)a3 date:(id)a4 sender:(id)a5 senderHandle:(id)a6 recipients:(id)a7 recipientHandles:(id)a8 transport:(id)a9
{
  id v15;
  __CFString *v16;
  unint64_t v17;
  id v18;
  id v19;
  __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  __CFString **v23;
  __CFString **v24;
  __CFString **v25;
  __CFString **v26;
  __CFString **v27;
  __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  uint64_t v32;
  void *v33;
  __CFString *v34;
  __CFString *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  __CFString *v48;
  void *v49;
  __CFString *v50;
  void *v51;
  void *v52;
  uint64_t i;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  __CFString *v63;
  __CFString *v64;
  void *v65;
  void *v66;
  __CFString *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  __CFString *v72;
  __CFString *v73;
  CSSearchableItemAttributeSet *v74;
  __CFString *v75;
  void *v76;
  void *v77;
  __CFString *v78;
  __CFString **v79;
  __CFString *v80;
  __int128 v81;
  __CFString *v82;
  __CFString *v83;
  __CFString *v84;
  __CFString *v85;
  unint64_t v86;
  __CFString *v87;
  _QWORD v88[3];

  v88[1] = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = (__CFString *)a5;
  v17 = (unint64_t)a6;
  v18 = a7;
  v19 = a8;
  v20 = (__CFString *)a9;
  if (v15)
  {
    if (!((unint64_t)v16 | v17))
    {
      v17 = 0;
      v16 = 0;
      goto LABEL_47;
    }
    v21 = objc_msgSend(v18, "count");
    v22 = objc_msgSend(v19, "count");
    if (!v21 || !v22 || v21 == v22)
    {
      v74 = self;
      *(_QWORD *)&v81 = v21;
      *((_QWORD *)&v81 + 1) = v22;
      if (a3)
      {
        if (a3 != 1)
          goto LABEL_47;
        v82 = v20;
        v77 = v19;
        v79 = MDItemUserSharedReceivedRecipientHandle;
        v23 = MDItemUserSharedReceivedRecipient;
        v24 = MDItemUserSharedReceivedTransport;
        v25 = MDItemUserSharedReceivedSenderHandle;
        v26 = MDItemUserSharedReceivedSender;
        v27 = MDItemUserSharedReceivedDate;
      }
      else
      {
        v82 = v20;
        v77 = v19;
        v79 = MDItemUserSharedSentRecipientHandle;
        v23 = MDItemUserSharedSentRecipient;
        v24 = MDItemUserSharedSentTransport;
        v25 = MDItemUserSharedSentSenderHandle;
        v26 = MDItemUserSharedSentSender;
        v27 = MDItemUserSharedSentDate;
      }
      v28 = *v27;
      v29 = *v26;
      v75 = *v25;
      v73 = *v24;
      v30 = *v23;
      v31 = *v79;
      if (!v16)
        v16 = &stru_1E2406B38;
      if (!v17)
        v17 = (unint64_t)&stru_1E2406B38;
      v80 = (__CFString *)v17;
      v20 = v82;
      if (!v82)
        v20 = &stru_1E2406B38;
      v72 = v28;
      -[CSSearchableItemAttributeSet _getNonNullValueForKey:](v74, "_getNonNullValueForKey:", v28);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v66, "count");
      v67 = v29;
      v63 = v31;
      v64 = v30;
      if (v32)
      {
        -[CSSearchableItemAttributeSet _getNonNullValueForKey:](v74, "_getNonNullValueForKey:", v29);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSSearchableItemAttributeSet _getNonNullValueForKey:](v74, "_getNonNullValueForKey:", v75);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSSearchableItemAttributeSet _getNonNullValueForKey:](v74, "_getNonNullValueForKey:", v73);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSSearchableItemAttributeSet _getNonNullValueForKey:](v74, "_getNonNullValueForKey:", v30);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSSearchableItemAttributeSet _getNonNullValueForKey:](v74, "_getNonNullValueForKey:", v31);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v33;
        v34 = v29;
        if (v32 != objc_msgSend(v33, "count")
          || v32 != objc_msgSend(v71, "count")
          || v32 != objc_msgSend(v70, "count")
          || v32 != objc_msgSend(v69, "count")
          || v32 != objc_msgSend(v68, "count"))
        {
          v32 = 0;
        }
      }
      else
      {
        v65 = 0;
        v70 = 0;
        v71 = 0;
        v68 = 0;
        v69 = 0;
        v34 = v29;
      }
      v35 = v73;
      if (v81 == 0)
      {
        if (v32)
        {
          objc_msgSend(v66, "arrayByAddingObject:", v15);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](v74, "_setArrayValue:withItemClass:forKey:", v43, objc_opt_class(), v72);

          objc_msgSend(v65, "arrayByAddingObject:", v16);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](v74, "_setArrayValue:withItemClass:forKey:", v44, objc_opt_class(), v34);

          objc_msgSend(v71, "arrayByAddingObject:", v16);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](v74, "_setArrayValue:withItemClass:forKey:", v45, objc_opt_class(), v75);

          objc_msgSend(v70, "arrayByAddingObject:", v16);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](v74, "_setArrayValue:withItemClass:forKey:", v46, objc_opt_class(), v73);

          objc_msgSend(v69, "arrayByAddingObject:", v16);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v64;
          -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](v74, "_setArrayValue:withItemClass:forKey:", v47, objc_opt_class(), v64);

          objc_msgSend(v68, "arrayByAddingObject:", v16);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v63;
          -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](v74, "_setArrayValue:withItemClass:forKey:", v49, objc_opt_class(), v63);

        }
        else
        {
          v88[0] = v15;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 1);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](v74, "_setArrayValue:withItemClass:forKey:", v57, objc_opt_class(), v72);

          v87 = v16;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](v74, "_setArrayValue:withItemClass:forKey:", v58, objc_opt_class(), v34);

          v86 = v17;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](v74, "_setArrayValue:withItemClass:forKey:", v59, objc_opt_class(), v75);

          v85 = v20;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](v74, "_setArrayValue:withItemClass:forKey:", v60, objc_opt_class(), v73);

          v48 = v64;
          -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](v74, "_setArrayValue:withItemClass:forKey:", &unk_1E242F928, objc_opt_class(), v64);
          v84 = v16;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v73;
          v50 = v63;
          -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](v74, "_setArrayValue:withItemClass:forKey:", v61, objc_opt_class(), v63);

        }
        v51 = v65;
      }
      else
      {
        v78 = v16;
        v83 = v20;
        v76 = v18;
        if ((_QWORD)v81)
          v36 = v81;
        else
          v36 = *((_QWORD *)&v81 + 1);
        if (v32)
        {
          v37 = (void *)objc_msgSend(v66, "mutableCopy");
          v38 = (void *)objc_msgSend(v65, "mutableCopy");
          v39 = (void *)objc_msgSend(v71, "mutableCopy");
          v40 = (void *)objc_msgSend(v70, "mutableCopy");
          v41 = (void *)objc_msgSend(v69, "mutableCopy");
          v42 = objc_msgSend(v68, "mutableCopy");
        }
        else
        {
          v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v36);
          v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v36);
          v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v36);
          v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v36);
          v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v36);
          v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v36);
        }
        v52 = (void *)v42;
        if (v36)
        {
          for (i = 0; i != v36; ++i)
          {
            v54 = v15;
            objc_msgSend(v37, "addObject:", v15);
            objc_msgSend(v38, "addObject:", v78);
            objc_msgSend(v39, "addObject:", v80);
            objc_msgSend(v40, "addObject:", v83);
            if ((_QWORD)v81)
            {
              objc_msgSend(v76, "objectAtIndexedSubscript:", i);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "addObject:", v55);

            }
            else
            {
              objc_msgSend(v41, "addObject:", &stru_1E2406B38);
            }
            if (*((_QWORD *)&v81 + 1))
            {
              objc_msgSend(v77, "objectAtIndexedSubscript:", i);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "addObject:", v56);

            }
            else
            {
              objc_msgSend(v52, "addObject:", &stru_1E2406B38);
            }
            v15 = v54;
          }
        }
        v62 = v37;
        -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](v74, "_setArrayValue:withItemClass:forKey:", v37, objc_opt_class(), v72);
        -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](v74, "_setArrayValue:withItemClass:forKey:", v38, objc_opt_class(), v67);
        -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](v74, "_setArrayValue:withItemClass:forKey:", v39, objc_opt_class(), v75);
        -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](v74, "_setArrayValue:withItemClass:forKey:", v40, objc_opt_class(), v73);
        v48 = v64;
        -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](v74, "_setArrayValue:withItemClass:forKey:", v41, objc_opt_class(), v64);
        v50 = v63;
        -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](v74, "_setArrayValue:withItemClass:forKey:", v52, objc_opt_class(), v63);

        v35 = v73;
        v34 = v67;

        v18 = v76;
        v20 = v83;
        v51 = v65;
        v16 = v78;
        v17 = (unint64_t)v80;
      }

      v19 = v77;
    }
  }
LABEL_47:

}

- (void)markAsSent:(id)a3 sender:(id)a4 senderHandle:(id)a5 recipients:(id)a6 recipientHandles:(id)a7 transport:(id)a8
{
  -[CSSearchableItemAttributeSet _markAs:date:sender:senderHandle:recipients:recipientHandles:transport:](self, "_markAs:date:sender:senderHandle:recipients:recipientHandles:transport:", 0, a3, a4, a5, a6, a7, a8);
}

- (void)markAsReceived:(id)a3 sender:(id)a4 senderHandle:(id)a5 recipients:(id)a6 recipientHandles:(id)a7 transport:(id)a8
{
  -[CSSearchableItemAttributeSet _markAs:date:sender:senderHandle:recipients:recipientHandles:transport:](self, "_markAs:date:sender:senderHandle:recipients:recipientHandles:transport:", 1, a3, a4, a5, a6, a7, a8);
}

- (void)_markAs:(id)a3 userHandle:(id)a4 dateKey:(id)a5 userHandleKey:(id)a6
{
  id v10;
  __CFString *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (__CFString *)a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    if (!v11)
      v11 = &stru_1E2406B38;
    -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");
    if (v15)
    {
      v16 = v15;
      -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 == objc_msgSend(v17, "count"))
      {
        objc_msgSend(v14, "arrayByAddingObject:", v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v18, objc_opt_class(), v12);

        objc_msgSend(v17, "arrayByAddingObject:", v11);
        v19 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v21 = (void *)v19;
        -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v19, objc_opt_class(), v13);

        goto LABEL_10;
      }
    }
    else
    {
      v17 = 0;
    }
    v23[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v20, objc_opt_class(), v12);

    v22 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_10:

}

- (void)markAsPrinted:(id)a3 userHandle:(id)a4
{
  -[CSSearchableItemAttributeSet _markAs:userHandle:dateKey:userHandleKey:](self, "_markAs:userHandle:dateKey:userHandleKey:", a3, a4, CFSTR("kMDItemUserPrintedDate"), CFSTR("kMDItemUserPrintedUserHandle"));
}

- (void)markAsDownloaded:(id)a3 userHandle:(id)a4
{
  -[CSSearchableItemAttributeSet _markAs:userHandle:dateKey:userHandleKey:](self, "_markAs:userHandle:dateKey:userHandleKey:", a3, a4, CFSTR("kMDItemUserDownloadedDate"), CFSTR("kMDItemUserDownloadedUserHandle"));
}

- (void)markAsModified:(id)a3 userHandle:(id)a4
{
  -[CSSearchableItemAttributeSet _markAs:userHandle:dateKey:userHandleKey:](self, "_markAs:userHandle:dateKey:userHandleKey:", a3, a4, CFSTR("kMDItemUserModifiedDate"), CFSTR("kMDItemUserModifiedUserHandle"));
}

- (void)markAsCreated:(id)a3 userHandle:(id)a4
{
  -[CSSearchableItemAttributeSet _markAs:userHandle:dateKey:userHandleKey:](self, "_markAs:userHandle:dateKey:userHandleKey:", a3, a4, CFSTR("kMDItemUserCreatedDate"), CFSTR("kMDItemUserCreatedUserHandle"));
}

- (void)setIntentData:(id)a3
{
  -[CSSearchableItemAttributeSet _setDataValue:forKey:](self, "_setDataValue:forKey:", a3, CFSTR("kMDItemIntentData"));
}

- (NSData)intentData
{
  return (NSData *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemIntentData"));
}

- (void)setSuggestedInvocationPhrase:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemSuggestedInvocationPhrase"));
}

- (NSString)suggestedInvocationPhrase
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemSuggestedInvocationPhrase"));
}

- (NSNumber)backgroundRunnable
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_MDItemBackgroundRunnable"));
}

- (void)setBackgroundRunnable:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("_MDItemBackgroundRunnable"));
}

- (void)setPunchoutLabel:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("_MDItemPunchoutLabel"));
}

- (NSString)punchoutLabel
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_MDItemPunchoutLabel"));
}

- (NSNumber)shortcutAvailability
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemShortcutAvailability"));
}

- (NSDate)lastApplicationLaunchedDate
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemApplicationLastLaunchedDate"));
}

- (void)setLastApplicationLaunchedDate:(id)a3
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", a3, CFSTR("_kMDItemApplicationLastLaunchedDate"));
}

- (NSNumber)isPlaceholder
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemIsPlaceholder"));
}

- (void)setIsPlaceholder:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("kMDItemIsPlaceholder"));
}

- (NSArray)topic
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemTopic"));
}

- (void)setTopic:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemTopic"));

}

- (NSNumber)portraitStaticScore
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemPortraitStaticScore"));
}

- (void)setPortraitStaticScore:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("_kMDItemPortraitStaticScore"));
}

- (NSData)portraitFeatureVector
{
  return (NSData *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemPortraitFeatureVector"));
}

- (void)setPortraitFeatureVector:(id)a3
{
  -[CSSearchableItemAttributeSet _setDataValue:forKey:](self, "_setDataValue:forKey:", a3, CFSTR("_kMDItemPortraitFeatureVector"));
}

- (NSNumber)portraitFeatureVectorVersion
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemPortraitFeatureVectorVersion"));
}

- (void)setPortraitFeatureVectorVersion:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("_kMDItemPortraitFeatureVectorVersion"));
}

- (void)setPortraitNamedEntities:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = objc_opt_class();
  -[CSSearchableItemAttributeSet _setDictionaryValue:withValueClass:keyClass:forKey:](self, "_setDictionaryValue:withValueClass:keyClass:forKey:", v5, v4, objc_opt_class(), CFSTR("_kMDItemPortraitNamedEntities"));

}

- (void)setPhoneCallStatus:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("com_apple_mobilephone_callStatus"), 1);

}

- (NSString)phoneCallStatus
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("com_apple_mobilephone_callStatus"));
}

- (void)setPhoneProvider:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("com_apple_mobilephone_provider"), 1);

}

- (NSString)phoneProvider
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("com_apple_mobilephone_provider"));
}

- (void)setPhoneSIM:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("com_apple_mobilephone_SIM"), 1);

}

- (NSString)phoneSIM
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("com_apple_mobilephone_SIM"));
}

- (void)setPhoneCallType:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("com_apple_mobilephone_callType"), 1);

}

- (NSString)phoneCallType
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("com_apple_mobilephone_callType"));
}

- (void)setPhoneCallBackURL:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("com_apple_mobilephone_callbackURL"), 0);

}

- (NSURL)phoneCallBackURL
{
  void *v2;
  id v3;
  void *v4;

  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("com_apple_mobilephone_callbackURL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
LABEL_7:

  return (NSURL *)v4;
}

- (void)setPhotosResultType:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosResultType"), 1);

}

- (NSString)photosResultType
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosResultType"));
}

- (void)setPhotosCollectionSubtitle:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosCollectionSubtitle"), 1);

}

- (NSString)photosCollectionSubtitle
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosCollectionSubtitle"));
}

- (void)setPhotosCollectionResultCount:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosCollectionResultCount"), 0);

}

- (NSNumber)photosCollectionResultCount
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosCollectionResultCount"));
}

- (void)setPhotosCollectionKeyAssetUUID:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosCollectionKeyAssetUUID"), 1);

}

- (NSString)photosCollectionKeyAssetUUID
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosCollectionKeyAssetUUID"));
}

- (void)setPhotosFavorited:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosFavorited"), 0);

}

- (NSNumber)photosFavorited
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosFavorited"));
}

- (void)setPhotosFavorites:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosFavorites"), 1);

}

- (NSString)photosFavorites
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosFavorites"));
}

- (void)setPhotosMemoryTitle:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosMemoryTitle"), 1);

}

- (NSString)photosMemoryTitle
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosMemoryTitle"));
}

- (void)setPhotosBusinessNames:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemPhotosBusinessNames"));

}

- (NSArray)photosBusinessNames
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosBusinessNames"));
}

- (void)setPhotosBusinessCategories:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemPhotosBusinessCategories"));

}

- (NSArray)photosBusinessCategories
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosBusinessCategories"));
}

- (void)setPhotosMediaTypes:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemPhotosMediaTypes"));

}

- (NSArray)photosMediaTypes
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosMediaTypes"));
}

- (void)setPhotosLocationKeywords:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemPhotosLocationKeywords"));

}

- (NSArray)photosLocationKeywords
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosLocationKeywords"));
}

- (void)setPhotosPeople:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemPhotosPeople"));

}

- (void)setPhotosEventNames:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemPhotosEventNames"));

}

- (NSArray)photosEventNames
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosEventNames"));
}

- (void)setPhotosSeasons:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemPhotosSeasons"));

}

- (NSArray)photosSeasons
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosSeasons"));
}

- (void)setPhotosHolidays:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemPhotosHolidays"));

}

- (NSArray)photosHolidays
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosHolidays"));
}

- (void)setPhotosSceneIdentifiers:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemPhotosSceneIdentifiers"));

}

- (NSArray)photosSceneIdentifiers
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosSceneIdentifiers"));
}

- (void)setPhotosScenes:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemPhotosScenes"));

}

- (NSArray)photosScenes
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosScenes"));
}

- (void)setPhotosMeanings:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemPhotosMeanings"));

}

- (NSArray)photosMeanings
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosMeanings"));
}

- (void)setPhotosEventCategories:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemPhotosEventCategories"));

}

- (NSArray)photosEventCategories
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosEventCategories"));
}

- (void)setPhotosEventPerformers:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemPhotosEventPerformers"));

}

- (NSArray)photosEventPerformers
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosEventPerformers"));
}

- (void)setPhotosEntityTitle:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosEntityTitle"), 1);

}

- (NSString)photosEntityTitle
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosEntityTitle"));
}

- (void)setPhotosSavedFromAppBundleIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosSavedFromAppBundleIdentifier"), 1);

}

- (NSString)photosSavedFromAppBundleIdentifier
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosSavedFromAppBundleIdentifier"));
}

- (void)setPhotosSavedFromAppName:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosSavedFromAppName"), 1);

}

- (NSString)photosSavedFromAppName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosSavedFromAppName"));
}

- (void)setPhotosDonationTimestamp:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosDonationTimestamp"), 0);

}

- (NSDate)photosDonationTimestamp
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosDonationTimestamp"));
}

- (void)setPhotosSharedLibraryContributors:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemPhotosSharedLibraryContributors"));

}

- (NSArray)photosSharedLibraryContributors
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosSharedLibraryContributors"));
}

- (void)setPhotosUtilityTypes:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemPhotosUtilityTypes"));

}

- (NSArray)photosUtilityTypes
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosUtilityTypes"));
}

- (void)setPhotosL2Signals:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemPhotosL2Signals"), 0);

}

- (NSData)photosL2Signals
{
  return (NSData *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemPhotosL2Signals"));
}

CSSceneClassification *__76__CSSearchableItemAttributeSet_CSPhotos_Private__photosSceneClassifications__block_invoke(uint64_t a1, unint64_t a2, void *a3, void *a4, double a5)
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  CSSceneClassification *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  double v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;

  v9 = a3;
  v10 = a4;
  if (*(_QWORD *)(a1 + 72) <= a2)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = objc_msgSend(v11, "unsignedLongValue");
    else
      v12 = 0;

  }
  if (*(_QWORD *)(a1 + 80) <= a2)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = objc_msgSend(v13, "unsignedShortValue");
    else
      v14 = 0;

  }
  if (*(_QWORD *)(a1 + 88) <= a2)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = objc_msgSend(v15, "unsignedShortValue");
    else
      v16 = 0;

  }
  v17 = -[CSSceneClassification initWithLabel:synonyms:confidence:sceneIdentifier:]([CSSceneClassification alloc], "initWithLabel:synonyms:confidence:sceneIdentifier:", v9, v10, v12, a5);
  if (*(_QWORD *)(a1 + 96))
  {
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v19 = *(_QWORD *)(v18 + 24);
    *(_QWORD *)(v18 + 24) = v19 + 4;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) <= *(_QWORD *)(a1 + 96))
    {
      objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v21 = 0.0;
      v22 = 0.0;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v20, "doubleValue");
        v22 = v23;
      }
      v24 = v19 + 2;
      objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", v19 + 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v25, "doubleValue");
        v21 = v26;
      }
      v27 = v19 + 3;
      objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", v24);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      v29 = 0.0;
      v30 = 0.0;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v28, "doubleValue");
        v30 = v31;
      }
      objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", v27);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v32, "doubleValue");
        v29 = v33;
      }
      -[CSSceneClassification setBoundingBox:](v17, "setBoundingBox:", v22, v21, v30, v29);

    }
  }
  if (v14)
    -[CSSceneClassification setSceneType:](v17, "setSceneType:", v14);
  if (v16)
    -[CSSceneClassification setMediaType:](v17, "setMediaType:", v16);

  return v17;
}

- (void)setPhotosSceneClassifications:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemPhotosSceneClassification"));

}

CSDocumentUnderstandingTopic *__77__CSSearchableItemAttributeSet_CSPhotos_Private__documentUnderstandingTopics__block_invoke(double a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7;
  id v8;
  CSDocumentUnderstandingTopic *v9;

  v7 = a5;
  v8 = a4;
  v9 = -[CSDocumentUnderstandingTopic initWithLabel:synonyms:confidence:]([CSDocumentUnderstandingTopic alloc], "initWithLabel:synonyms:confidence:", v8, v7, a1);

  return v9;
}

- (void)setDocumentUnderstandingTopics:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemDocumentUnderstandingTopics"));

}

- (void)setDocumentUnderstandingTopicsVersion:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemDocumentUnderstandingTopicsVersion"), 0);

}

- (NSNumber)documentUnderstandingTopicsVersion
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemDocumentUnderstandingTopicsVersion"));
}

CSDocumentUnderstandingCategory *__81__CSSearchableItemAttributeSet_CSPhotos_Private__documentUnderstandingCategories__block_invoke(double a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7;
  id v8;
  CSDocumentUnderstandingCategory *v9;

  v7 = a5;
  v8 = a4;
  v9 = -[CSDocumentUnderstandingCategory initWithLabel:synonyms:confidence:]([CSDocumentUnderstandingCategory alloc], "initWithLabel:synonyms:confidence:", v8, v7, a1);

  return v9;
}

- (void)setDocumentUnderstandingCategories:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemDocumentUnderstandingCategories"));

}

- (void)setDocumentUnderstandingCategoriesVersion:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemDocumentUnderstandingCategoriesVersion"), 0);

}

- (NSNumber)documentUnderstandingCategoriesVersion
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemDocumentUnderstandingCategoriesVersion"));
}

- (void)setAestheticScore:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemAestheticScore"), 0);

}

- (NSNumber)aestheticScore
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAestheticScore"));
}

- (void)setCurationScore:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemCurationScore"), 0);

}

- (NSNumber)curationScore
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemCurationScore"));
}

- (void)setIsProResVideo:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemIsProResVideo"), 0);

}

- (NSNumber)isProResVideo
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemIsProResVideo"));
}

- (void)setSavingApplication:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemSavingApplication"), 1);

}

- (NSString)savingApplication
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemSavingApplication"));
}

- (void)setSavingApplicationBundleIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemSavingApplicationBundleIdentifier"), 1);

}

- (NSString)savingApplicationBundleIdentifier
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemSavingApplicationBundleIdentifier"));
}

- (void)setHasTopMomentScore:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemHasTopMomentScore"), 0);

}

- (NSNumber)hasTopMomentScore
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemHasTopMomentScore"));
}

- (void)setIsCinematicVideo:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemIsCinematicVideo"), 0);

}

- (NSNumber)isCinematicVideo
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemIsCinematicVideo"));
}

- (void)setEligibleForPhotosProcessing:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemEligibleForPhotosProcessing"), 0);

}

- (NSNumber)eligibleForPhotosProcessing
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemEligibleForPhotosProcessing"));
}

- (void)setPhotosLibraryName:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosLibraryName"), 1);

}

- (NSString)photosLibraryName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosLibraryName"));
}

- (void)setPhotosContributor:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosContributor"), 1);

}

- (void)setPhotosAcquisitionMake:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemAcquisitionMake"), 1);

}

- (NSString)photosAcquisitionMake
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAcquisitionMake"));
}

- (void)setPhotosAcquisitionModel:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemAcquisitionModel"), 1);

}

- (NSString)photosAcquisitionModel
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAcquisitionModel"));
}

- (void)setPhotosDuration:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemDurationSeconds"), 0);

}

- (NSNumber)photosDuration
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemDurationSeconds"));
}

- (void)setPhotosContentCreationDate:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemContentCreationDate"), 0);

}

- (NSDate)photosContentCreationDate
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemContentCreationDate"));
}

- (void)setPhotosContentCreationDateMonth:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosContentCreationDateMonth"), 1);

}

- (NSString)photosContentCreationDateMonth
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosContentCreationDateMonth"));
}

- (void)setPhotosContentCreationDateMonths:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosContentCreationDateMonths"), 1);

}

- (NSArray)photosContentCreationDateMonths
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosContentCreationDateMonths"));
}

- (void)setPhotosContentCreationDateYear:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosContentCreationDateYear"), 1);

}

- (NSString)photosContentCreationDateYear
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosContentCreationDateYear"));
}

- (void)setPhotosContentCreationDateYears:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosContentCreationDateYears"), 1);

}

- (id)photosContentCreationDateYeasr
{
  return -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosContentCreationDateYears"));
}

- (void)setPhotosContentType:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemContentType"), 1);

}

- (NSString)photosContentType
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemContentType"));
}

- (void)setPhotosTitle:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosTitle"), 1);

}

- (NSString)photosTitle
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosTitle"));
}

- (void)setPhotosContentDescription:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosDescription"), 1);

}

- (NSString)photosContentDescription
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosDescription"));
}

- (void)setPhotosDisplayName:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemDisplayName"), 1);

}

- (NSString)photosDisplayName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemDisplayName"));
}

- (void)setPhotosFilename:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemFilename"), 1);

}

- (NSString)photosFilename
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemFilename"));
}

- (void)setPhotosKeywords:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemPhotosKeywords"));

}

- (NSArray)photosKeywords
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosKeywords"));
}

- (void)setPhotosContainerIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemContainerIdentifier"), 1);

}

- (NSString)photosContainerIdentifier
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemContainerIdentifier"));
}

- (void)setPhotosContentRating:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemContentRating"), 0);

}

- (NSNumber)photosContentRating
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemContentRating"));
}

- (void)setPhotosAestheticScore:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemAestheticScore"), 0);

}

- (NSNumber)photosAestheticScore
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemAestheticScore"));
}

- (void)setPhotosCurationScore:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemCurationScore"), 0);

}

- (NSNumber)photosCurationScore
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemCurationScore"));
}

- (void)setPhotosSavingApplication:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemSavingApplication"), 1);

}

- (NSString)photosSavingApplication
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemSavingApplication"));
}

- (void)setPhotosSavingApplicationBundleIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemSavingApplicationBundleIdentifier"), 1);

}

- (NSString)photosSavingApplicationBundleIdentifier
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemSavingApplicationBundleIdentifier"));
}

- (void)setPhotosHasTopMomentScore:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemHasTopMomentScore"), 0);

}

- (NSNumber)photosHasTopMomentScore
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemHasTopMomentScore"));
}

- (void)setPhotosIsProResVideo:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemIsProResVideo"), 0);

}

- (NSNumber)photosIsProResVideo
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemIsProResVideo"));
}

- (void)setPhotosTimeZoneName:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosTimeZoneName"), 1);

}

- (NSString)photosTimeZoneName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosTimeZoneName"));
}

- (void)setPhotosTimeZoneOffset:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosTimeZoneOffset"), 0);

}

- (NSNumber)photosTimeZoneOffset
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosTimeZoneOffset"));
}

- (void)setPhotosInferredTimeZoneOffset:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosInferredTimeZoneOffset"), 0);

}

- (NSNumber)photosInferredTimeZoneOffset
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosInferredTimeZoneOffset"));
}

- (void)setPhotosDonationState:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosDonationState"), 0);

}

- (NSNumber)photosDonationState
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosDonationState"));
}

- (void)setPhotosCharacterRecognitionAnalysisVersion:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosCharacterRecognitionAnalysisVersion"), 0);

}

- (NSNumber)photosCharacterRecognitionAnalysisVersion
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosCharacterRecognitionAnalysisVersion"));
}

- (void)setPhotosFaceAnalysisVersion:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosFaceAnalysisVersion"), 0);

}

- (NSNumber)photosFaceAnalysisVersion
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosFaceAnalysisVersion"));
}

- (void)setPhotosLocationPrivateEncryptedComputeAnalysisVersion:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosLocationPrivateEncryptedComputeAnalysisVersion"), 0);

}

- (NSNumber)photosLocationPrivateEncryptedComputeAnalysisVersion
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosLocationPrivateEncryptedComputeAnalysisVersion"));
}

- (void)setPhotosMediaAnalysisVersion:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosMediaAnalysisVersion"), 0);

}

- (NSNumber)photosMediaAnalysisVersion
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosMediaAnalysisVersion"));
}

- (void)setPhotosMediaAnalysisImageVersion:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosMediaAnalysisImageVersion"), 0);

}

- (NSNumber)photosMediaAnalysisImageVersion
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosMediaAnalysisImageVersion"));
}

- (void)setPhotosPrivateEncryptedComputeAnalysisVersion:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosPrivateEncryptedComputeAnalysisVersion"), 0);

}

- (NSNumber)photosPrivateEncryptedComputeAnalysisVersion
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosPrivateEncryptedComputeAnalysisVersion"));
}

- (void)setPhotosSceneAnalysisVersion:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemPhotosSceneAnalysisVersion"), 0);

}

- (NSNumber)photosSceneAnalysisVersion
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemPhotosSceneAnalysisVersion"));
}

- (void)setPhotosIsCinematicVideo:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemIsCinematicVideo"), 0);

}

- (NSNumber)photosIsCinematicVideo
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemIsCinematicVideo"));
}

- (NSArray)photosTextContentPieces
{
  return 0;
}

- (NSArray)photosMatchingLabelsIndexes
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDQueryResultMatchingArrayIndexes.kMDItemPhotosSceneClassificationLabels"));
}

- (NSArray)photosMatchingLSynonymsIndexes
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDQueryResultMatchingArrayIndexes.kMDItemPhotosSceneClassificationSynonyms"));
}

- (void)setXmpCredit:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemXMPCredit"));
}

- (NSString)xmpCredit
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemXMPCredit"));
}

- (void)setXmpDigitalSourceType:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("kMDItemXMPDigitalSourceType"));
}

- (NSString)xmpDigitalSourceType
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemXMPDigitalSourceType"));
}

- (NSNumber)lastMotionActivityState
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_MDItemLastMotionActivityState"));
}

- (void)setLastMotionActivityState:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("_MDItemLastMotionActivityState"));
}

- (NSString)messageSuggestedContactPhotoPath
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("com_apple_mobilesms_suggested_contact_photo"));
}

- (void)setMessageSuggestedContactPhotoPath:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("com_apple_mobilesms_suggested_contact_photo"));
}

- (NSString)messageSuggestedContactName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("com_apple_mobilesms_suggested_contact_name"));
}

- (void)setMessageSuggestedContactName:(id)a3
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("com_apple_mobilesms_suggested_contact_name"));
}

- (void)setMessagePinned:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemMessagePinned"), 0);

}

- (NSNumber)messagePinned
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemMessagePinned"));
}

- (void)setTapbackAssociatedMessageID:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemTapbackAssociatedMessageID"), 1);

}

- (NSString)tapbackAssociatedMessageID
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemTapbackAssociatedMessageID"));
}

- (void)setMessageTapbackStringValue:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemMessageTapbackStringValue"), 1);

}

- (NSString)messageTapbackStringValue
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemMessageTapbackStringValue"));
}

- (void)setMessageType:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemMessageType"), 1);

}

- (NSString)messageType
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemMessageType"));
}

- (void)setMessageService:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemMessageService"), 1);

}

- (NSString)messageService
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemMessageService"));
}

- (void)setMessageMentionedAddresses:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("_kMDItemMessageMentionedAddresses"));

}

- (NSArray)messageMentionedAddresses
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemMessageMentionedAddresses"));
}

- (void)setMessageRead:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemMessageRead"), 0);

}

- (NSNumber)messageRead
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemMessageRead"));
}

- (void)setIsMessageFromKnownSender:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemMessageFromKnownSender"), 0);

}

- (NSNumber)isMessageFromKnownSender
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemMessageFromKnownSender"));
}

- (void)setMessageTapbackType:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemMessageTapbackType"), 0);

}

- (int)messageTapbackType
{
  void *v2;
  int v3;

  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemMessageTapbackType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (void)setMessageEffectType:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemMessageEffectType"), 0);

}

- (int)messageEffectType
{
  void *v2;
  int v3;

  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemMessageEffectType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (void)setThreadIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemThreadIdentifier"), 1);

}

- (NSString)threadIdentifier
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemThreadIdentifier"));
}

- (void)setIsCommunicationNotification:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemIsCommunicationNotification"), 0);

}

- (NSNumber)isCommunicationNotification
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemIsCommunicationNotification"));
}

- (void)setNotificationTimeSensitive:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemNotificationTimeSensitive"), 0);

}

- (NSNumber)notificationTimeSensitive
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemNotificationTimeSensitive"));
}

- (void)setNotificationCritical:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemNotificationCritical"), 0);

}

- (NSNumber)notificationCritical
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemNotificationCritical"));
}

- (NSNumber)isZombie
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemIsZombie"));
}

- (void)setIsZombie:(id)a3
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", a3, CFSTR("_kMDItemIsZombie"));
}

- (void)setContainerTitle:(NSString *)containerTitle
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", containerTitle, CFSTR("kMDItemContainerTitle"));
}

- (NSString)containerTitle
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemContainerTitle"));
}

- (void)setContainerDisplayName:(NSString *)containerDisplayName
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", containerDisplayName, CFSTR("kMDItemContainerDisplayName"));
}

- (NSString)containerDisplayName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemContainerDisplayName"));
}

- (void)setContainerIdentifier:(NSString *)containerIdentifier
{
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", containerIdentifier, CFSTR("kMDItemContainerIdentifier"));
}

- (NSString)containerIdentifier
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemContainerIdentifier"));
}

- (void)setContainerOrder:(NSNumber *)containerOrder
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", containerOrder, CFSTR("kMDItemContainerOrder"));
}

- (NSNumber)containerOrder
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemContainerOrder"));
}

- (void)setAllDay:(NSNumber *)allDay
{
  -[CSSearchableItemAttributeSet _setNumberValue:forKey:](self, "_setNumberValue:forKey:", allDay, CFSTR("kMDItemIsAllDay"));
}

- (NSNumber)allDay
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemIsAllDay"));
}

- (void)setValue:(id)value forCustomKey:(CSCustomAttributeKey *)key
{
  CSCustomAttributeKey *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = value;
  v6 = key;
  -[CSCustomAttributeKey keyName](v6, "keyName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v12)
    {
      -[CSSearchableItemAttributeSet customAttributes](self, "customAttributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = v12;
    }
    else
    {
      v11 = (void *)*MEMORY[0x1E0C9B0D0];
      -[CSSearchableItemAttributeSet customAttributes](self, "customAttributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = v11;
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v6);

  }
}

- (id)valueForCustomKey:(CSCustomAttributeKey *)key
{
  void *v4;
  void *v5;

  -[CSCustomAttributeKey keyName](key, "keyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CSSearchableItemAttributeSet attributeForKey:](self, "attributeForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __80__CSSearchableItemAttributeSet_CSCoderAdditions__encodeWithCSCoder_includeText___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4)
{
  int v8;
  void *v9;
  void *v10;
  int PlistObjectType;
  void *v12;
  id v13;
  _BYTE v14[24];
  __int128 v15;
  uint64_t v16;

  v8 = *(unsigned __int8 *)(a1 + 48);
  if (*(_BYTE *)(a1 + 48)
    && (v9 = *(void **)(*(_QWORD *)(a1 + 32) + 32),
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2),
        v13 = (id)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "objectForKeyedSubscript:"),
        (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    v15 = *a4;
    v16 = *((_QWORD *)a4 + 2);
    PlistObjectType = _MDPlistGetPlistObjectType();
    if (v8)

    if (PlistObjectType == 240)
    {
      v15 = *a4;
      v16 = *((_QWORD *)a4 + 2);
      if (_MDPlistArrayGetCount() == 2)
      {
        objc_msgSend(*(id *)(a1 + 40), "encodeString:length:", a2, a3);
        v12 = *(void **)(a1 + 40);
        v15 = *a4;
        v16 = *((_QWORD *)a4 + 2);
        _MDPlistArrayGetPlistObjectAtIndex();
        objc_msgSend(v12, "encodeMDPlistObject:", v14);
      }
    }
  }
}

- (void)setInstantAnswers:(id)a3
{
  id v4;

  +[CSInstantAnswer dataFromInstantAnswers:](CSInstantAnswer, "dataFromInstantAnswers:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet _setDataValue:forKey:](self, "_setDataValue:forKey:", v4, CFSTR("kMDQueryResultInstantAnswers"));

}

- (id)instantAnswers
{
  void *v2;
  void *v3;

  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDQueryResultInstantAnswers"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[CSInstantAnswer instantAnswersFromData:](CSInstantAnswer, "instantAnswersFromData:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setDonatedEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "data");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet _setDataValue:forKey:](self, "_setDataValue:forKey:", v14, CFSTR("kMDItemDonatedEvent"));
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", v5, CFSTR("kMDItemDonatedEventType"));

  objc_msgSend(v4, "flightNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", v6, CFSTR("kMDItemDonatedEventFlightNumber"));

  objc_msgSend(v4, "flightCarrier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", v7, CFSTR("kMDItemDonatedEventFlightCarrier"));

  objc_msgSend(v4, "arrivalAirportCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", v8, CFSTR("kMDItemDonatedEventArrivalAirportCode"));

  objc_msgSend(v4, "arrivalAirportName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", v9, CFSTR("kMDItemDonatedEventArrivalAirportName"));

  objc_msgSend(v4, "departureAirportCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", v10, CFSTR("kMDItemDonatedEventDepartureAirportCode"));

  objc_msgSend(v4, "departureAirportName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", v11, CFSTR("kMDItemDonatedEventDepartureAirportName"));

  objc_msgSend(v4, "courierName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", v12, CFSTR("kMDItemDonatedEventCourierName"));

  objc_msgSend(v4, "merchantName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", v13, CFSTR("kMDItemDonatedEventMerchantName"));
}

- (CSDonatedEvent)donatedEvent
{
  void *v2;
  void *v3;

  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemDonatedEvent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[CSDonatedEvent eventFromData:](CSDonatedEvent, "eventFromData:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (CSDonatedEvent *)v3;
}

- (void)setFlightNumber:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightNumber"), 1);

}

- (NSString)flightNumber
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightNumber"));
}

- (void)setFlightCheckInUrl:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightCheckInUrl"), 1);

}

- (NSString)flightCheckInUrl
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightCheckInUrl"));
}

- (void)setFlightBookingInfoUrl:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightBookingInfoUrl"), 1);

}

- (NSString)flightBookingInfoUrl
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightBookingInfoUrl"));
}

- (void)setFlightStatus:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightStatus"), 1);

}

- (NSString)flightStatus
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightStatus"));
}

- (void)setFlightCarrier:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightCarrier"), 1);

}

- (NSString)flightCarrier
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightCarrier"));
}

- (void)setFlightCarrierCode:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightCarrierCode"), 1);

}

- (NSString)flightCarrierCode
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightCarrierCode"));
}

- (void)setFlightArrivalTimeZone:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightArrivalTimeZone"), 1);

}

- (NSString)flightArrivalTimeZone
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightArrivalTimeZone"));
}

- (void)setFlightDepartureTimeZone:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightDepartureTimeZone"), 1);

}

- (NSString)flightDepartureTimeZone
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightDepartureTimeZone"));
}

- (void)setFlightArrivalAirportCode:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightArrivalAirportCode"), 1);

}

- (NSString)flightArrivalAirportCode
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightArrivalAirportCode"));
}

- (void)setFlightArrivalAirportName:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightArrivalAirportName"), 1);

}

- (NSString)flightArrivalAirportName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightArrivalAirportName"));
}

- (void)setFlightDepartureAirportCode:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightDepartureAirportCode"), 1);

}

- (NSString)flightDepartureAirportCode
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightDepartureAirportCode"));
}

- (void)setFlightDepartureAirportName:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightDepartureAirportName"), 1);

}

- (NSString)flightDepartureAirportName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightDepartureAirportName"));
}

- (void)setFlightArrivalAirportLatitude:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightArrivalAirportLatitude"), 0);

}

- (NSNumber)flightArrivalAirportLatitude
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightArrivalAirportLatitude"));
}

- (void)setFlightDepartureAirportLatitude:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightDepartureAirportLatitude"), 0);

}

- (NSNumber)flightDepartureAirportLatitude
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightDepartureAirportLatitude"));
}

- (void)setFlightArrivalAirportLongitude:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightArrivalAirportLongitude"), 0);

}

- (NSNumber)flightArrivalAirportLongitude
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightArrivalAirportLongitude"));
}

- (void)setFlightDepartureAirportLongitude:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightDepartureAirportLongitude"), 0);

}

- (NSNumber)flightDepartureAirportLongitude
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightDepartureAirportLongitude"));
}

- (void)setFlightArrivalAirportInternationalNames:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightArrivalAirportInternationalNames"));

}

- (NSArray)flightArrivalAirportInternationalNames
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightArrivalAirportInternationalNames"));
}

- (void)setFlightDepartureAirportInternationalNames:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightDepartureAirportInternationalNames"));

}

- (NSArray)flightDepartureAirportInternationalNames
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightDepartureAirportInternationalNames"));
}

- (void)setFlightPassengerNames:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightPassengerNames"));

}

- (NSArray)flightPassengerNames
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightPassengerNames"));
}

- (void)setFlightPassengerSeatNumbers:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightPassengerSeatNumbers"));

}

- (NSArray)flightPassengerSeatNumbers
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightPassengerSeatNumbers"));
}

- (void)setFlightArrivalTerminal:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightArrivalTerminal"), 1);

}

- (NSString)flightArrivalTerminal
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightArrivalTerminal"));
}

- (void)setFlightDepartureTerminal:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightDepartureTerminal"), 1);

}

- (NSString)flightDepartureTerminal
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightDepartureTerminal"));
}

- (void)setFlightConfirmationNumber:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightConfirmationNumber"), 1);

}

- (NSString)flightConfirmationNumber
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightConfirmationNumber"));
}

- (void)setFlightArrivalAirportAddress:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightArrivalAirportAddress"), 1);

}

- (NSString)flightArrivalAirportAddress
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightArrivalAirportAddress"));
}

- (void)setFlightArrivalAirportStreetAddress:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightArrivalAirportStreetAddress"), 1);

}

- (NSString)flightArrivalAirportStreetAddress
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightArrivalAirportStreetAddress"));
}

- (void)setFlightArrivalAirportLocality:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightArrivalAirportLocality"), 1);

}

- (NSString)flightArrivalAirportLocality
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightArrivalAirportLocality"));
}

- (void)setFlightArrivalAirportRegion:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightArrivalAirportRegion"), 1);

}

- (NSString)flightArrivalAirportRegion
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightArrivalAirportRegion"));
}

- (void)setFlightArrivalAirportPostalCode:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightArrivalAirportPostalCode"), 1);

}

- (NSString)flightArrivalAirportPostalCode
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightArrivalAirportPostalCode"));
}

- (void)setFlightArrivalAirportCountry:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightArrivalAirportCountry"), 1);

}

- (NSString)flightArrivalAirportCountry
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightArrivalAirportCountry"));
}

- (void)setFlightDepartureAirportAddress:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightDepartureAirportAddress"), 1);

}

- (NSString)flightDepartureAirportAddress
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightDepartureAirportAddress"));
}

- (void)setFlightDepartureAirportStreetAddress:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightDepartureAirportStreetAddress"), 1);

}

- (NSString)flightDepartureAirportStreetAddress
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightDepartureAirportStreetAddress"));
}

- (void)setFlightDepartureAirportLocality:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightDepartureAirportLocality"), 1);

}

- (NSString)flightDepartureAirportLocality
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightDepartureAirportLocality"));
}

- (void)setFlightDepartureAirportRegion:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightDepartureAirportRegion"), 1);

}

- (NSString)flightDepartureAirportRegion
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightDepartureAirportRegion"));
}

- (void)setFlightDepartureAirportPostalCode:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightDepartureAirportPostalCode"), 1);

}

- (NSString)flightDepartureAirportPostalCode
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightDepartureAirportPostalCode"));
}

- (void)setFlightDepartureAirportCountry:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightDepartureAirportCountry"), 1);

}

- (NSString)flightDepartureAirportCountry
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightDepartureAirportCountry"));
}

- (void)setFlightArrivalAirportAddressSynonyms:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightArrivalAirportAddressSynonyms"));

}

- (NSArray)flightArrivalAirportAddressSynonyms
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightArrivalAirportAddressSynonyms"));
}

- (void)setFlightDepartureAirportAddressSynonyms:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemEventFlightDepartureAirportAddressSynonyms"));

}

- (NSArray)flightDepartureAirportAddressSynonyms
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightDepartureAirportAddressSynonyms"));
}

- (void)setFlightDepartureDateTime:(id)a3
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", a3, CFSTR("kMDItemStartDate"));
}

- (NSDate)flightDepartureDateTime
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemStartDate"));
}

- (void)setFlightDesignator:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  logForCSLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CSRedactString(v4, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_18C42F000, v5, OS_LOG_TYPE_DEFAULT, "[instant answers][donation] flight event donated with designator = %@", (uint8_t *)&v7, 0xCu);

  }
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", v4, CFSTR("kMDItemEventFlightDesignator"));

}

- (NSString)flightDesignator
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventFlightDesignator"));
}

- (void)setFlightArrivalDateTime:(id)a3
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", a3, CFSTR("kMDItemEndDate"));
}

- (NSDate)flightArrivalDateTime
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEndDate"));
}

- (void)setHotelUnderName:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventHotelUnderName"), 1);

}

- (NSString)hotelUnderName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventHotelUnderName"));
}

- (void)setHotelTimeZone:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventHotelTimeZone"), 1);

}

- (NSString)hotelTimeZone
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventHotelTimeZone"));
}

- (void)setHotelProvider:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventHotelProvider"), 1);

}

- (NSString)hotelProvider
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventHotelProvider"));
}

- (void)setHotelModifyReservationUrl:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventHotelModifyReservationUrl"), 1);

}

- (NSString)hotelModifyReservationUrl
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventHotelModifyReservationUrl"));
}

- (void)setHotelReservationForName:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventHotelReservationForName"), 1);

}

- (NSString)hotelReservationForName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventHotelReservationForName"));
}

- (void)setHotelReservationForTelephone:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventHotelReservationForTelephone"), 1);

}

- (NSString)hotelReservationForTelephone
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventHotelReservationForTelephone"));
}

- (void)setHotelReservationForAddress:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventHotelReservationForAddress"), 1);

}

- (NSString)hotelReservationForAddress
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventHotelReservationForAddress"));
}

- (void)setHotelReservationForStreetAddress:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventHotelReservationForStreetAddress"), 1);

}

- (NSString)hotelReservationForStreetAddress
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventHotelReservationForStreetAddress"));
}

- (void)setHotelReservationForAddressLocality:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventHotelReservationForAddressLocality"), 1);

}

- (NSString)hotelReservationForAddressLocality
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventHotelReservationForAddressLocality"));
}

- (void)setHotelReservationForAddressRegion:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventHotelReservationForAddressRegion"), 1);

}

- (NSString)hotelReservationForAddressRegion
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventHotelReservationForAddressRegion"));
}

- (void)setHotelReservationForAddressPostalCode:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventHotelReservationForAddressPostalCode"), 1);

}

- (NSString)hotelReservationForAddressPostalCode
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventHotelReservationForAddressPostalCode"));
}

- (void)setHotelReservationForAddressCountry:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventHotelReservationForAddressCountry"), 1);

}

- (NSString)hotelReservationForAddressCountry
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventHotelReservationForAddressCountry"));
}

- (void)setHotelReservationForAddressSynonyms:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemEventHotelReservationForAddressSynonyms"));

}

- (NSArray)hotelReservationForAddressSynonyms
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventHotelReservationForAddressSynonyms"));
}

- (void)setHotelReservationId:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  logForCSLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CSRedactString(v4, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_18C42F000, v5, OS_LOG_TYPE_DEFAULT, "[instant answers][donation] hotel event donated with reservationID = %@", (uint8_t *)&v7, 0xCu);

  }
  -[CSSearchableItemAttributeSet _setStringValue:forKey:](self, "_setStringValue:forKey:", v4, CFSTR("kMDItemEventHotelReservationId"));

}

- (NSString)hotelReservationId
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventHotelReservationId"));
}

- (void)setHotelCheckinDate:(id)a3
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", a3, CFSTR("kMDItemStartDate"));
}

- (NSDate)hotelCheckinDate
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemStartDate"));
}

- (void)setHotelCheckinTime:(id)a3
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", a3, CFSTR("kMDItemStartDate"));
}

- (NSDate)hotelCheckinTime
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemStartDate"));
}

- (void)setHotelCheckoutDate:(id)a3
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", a3, CFSTR("kMDItemEndDate"));
}

- (NSDate)hotelCheckoutDate
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEndDate"));
}

- (void)setHotelCheckoutTime:(id)a3
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", a3, CFSTR("kMDItemEndDate"));
}

- (NSDate)hotelCheckoutTime
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEndDate"));
}

- (void)setCachedViewData:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if ((float)((float)(unint64_t)objc_msgSend(v4, "length") * 0.00097656) >= 2.0)
  {
    logForCSLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CSSearchableItemAttributeSet(SwiftUI_Archiving) setCachedViewData:].cold.1(v5);

  }
  else
  {
    -[CSSearchableItemAttributeSet _setDataValue:forKey:](self, "_setDataValue:forKey:", v4, CFSTR("MDItemCachedViewData"));
  }

}

- (NSData)cachedViewData
{
  return (NSData *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("MDItemCachedViewData"));
}

- (void)setRestaurantReservationId:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventRestaurantReservationId"), 1);

}

- (NSString)restaurantReservationId
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventRestaurantReservationId"));
}

- (void)setRestaurantUnderName:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventRestaurantUnderName"), 1);

}

- (NSString)restaurantUnderName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventRestaurantUnderName"));
}

- (void)setRestaurantTimeZone:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventRestaurantTimeZone"), 1);

}

- (NSString)restaurantTimeZone
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventRestaurantTimeZone"));
}

- (void)setRestaurantPartySize:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventRestaurantPartySize"), 1);

}

- (NSString)restaurantPartySize
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventRestaurantPartySize"));
}

- (void)setRestaurantMealType:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventRestaurantMealType"), 1);

}

- (NSString)restaurantMealType
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventRestaurantMealType"));
}

- (void)setRestaurantReservationForName:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventRestaurantReservationForName"), 1);

}

- (NSString)restaurantReservationForName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventRestaurantReservationForName"));
}

- (void)setRestaurantReservationForTelephone:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventRestaurantReservationForTelephone"), 1);

}

- (NSString)restaurantReservationForTelephone
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventRestaurantReservationForTelephone"));
}

- (void)setRestaurantReservationForAddress:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventRestaurantReservationForAddress"), 1);

}

- (NSString)restaurantReservationForAddress
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventRestaurantReservationForAddress"));
}

- (void)setRestaurantReservationForStreetAddress:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventRestaurantReservationForStreetAddress"), 1);

}

- (NSString)restaurantReservationForStreetAddress
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventRestaurantReservationForStreetAddress"));
}

- (void)setRestaurantReservationForAddressLocality:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventRestaurantReservationForAddressLocality"), 1);

}

- (NSString)restaurantReservationForAddressLocality
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventRestaurantReservationForAddressLocality"));
}

- (void)setRestaurantReservationForAddressRegion:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventRestaurantReservationForAddressRegion"), 1);

}

- (NSString)restaurantReservationForAddressRegion
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventRestaurantReservationForAddressRegion"));
}

- (void)setRestaurantReservationForAddressPostalCode:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventRestaurantReservationForAddressPostalCode"), 1);

}

- (NSString)restaurantReservationForAddressPostalCode
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventRestaurantReservationForAddressPostalCode"));
}

- (void)setRestaurantReservationForAddressCountry:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventRestaurantReservationForAddressCountry"), 1);

}

- (NSString)restaurantReservationForAddressCountry
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventRestaurantReservationForAddressCountry"));
}

- (void)setRestaurantReservationForAddressSynonyms:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("kMDItemEventRestaurantReservationForAddressSynonyms"));

}

- (NSArray)restaurantReservationForAddressSynonyms
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventRestaurantReservationForAddressSynonyms"));
}

- (void)setRestaurantStartDate:(id)a3
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", a3, CFSTR("kMDItemStartDate"));
}

- (NSDate)restaurantStartDate
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemStartDate"));
}

- (void)setRestaurantStartTime:(id)a3
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", a3, CFSTR("kMDItemStartDate"));
}

- (NSDate)restaurantStartTime
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemStartDate"));
}

- (void)setTicketReservationId:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventTicketReservationId"), 1);

}

- (NSString)ticketReservationId
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventTicketReservationId"));
}

- (void)setTicketUnderName:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventTicketUnderName"), 1);

}

- (NSString)ticketUnderName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventTicketUnderName"));
}

- (void)setTicketReservationForName:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventTicketReservationForName"), 1);

}

- (NSString)ticketReservationForName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventTicketReservationForName"));
}

- (void)setTicketTimeZone:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventTicketTimeZone"), 1);

}

- (NSString)ticketTimeZone
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventTicketTimeZone"));
}

- (void)setTicketReservationForLocationName:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventTicketReservationForLocationName"), 1);

}

- (NSString)ticketReservationForLocationName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventTicketReservationForLocationName"));
}

- (void)setTicketReservationForLocationAddress:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventTicketReservationForLocationAddress"), 1);

}

- (NSString)ticketReservationForLocationAddress
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventTicketReservationForLocationAddress"));
}

- (void)setTicketReservationForLocationAddressStreetAddress:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventTicketReservationForLocationAddressStreetAddress"), 1);

}

- (NSString)ticketReservationForLocationAddressStreetAddress
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventTicketReservationForLocationAddressStreetAddress"));
}

- (void)setTicketReservationForLocationAddressLocality:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventTicketReservationForLocationAddressLocality"), 1);

}

- (NSString)ticketReservationForLocationAddressLocality
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventTicketReservationForLocationAddressLocality"));
}

- (void)setTicketReservationForLocationAddressRegion:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventTicketReservationForLocationAddressRegion"), 1);

}

- (NSString)ticketReservationForLocationAddressRegion
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventTicketReservationForLocationAddressRegion"));
}

- (void)setTicketReservationForLocationAddressPostalCode:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventTicketReservationForLocationAddressPostalCode"), 1);

}

- (NSString)ticketReservationForLocationAddressPostalCode
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventTicketReservationForLocationAddressPostalCode"));
}

- (void)setTicketReservationForLocationAddressCountry:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventTicketReservationForLocationAddressCountry"), 1);

}

- (NSString)ticketReservationForLocationAddressCountry
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventTicketReservationForLocationAddressCountry"));
}

- (void)setTicketReservedTicketNumber:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventTicketReservedTicketNumber"), 1);

}

- (NSString)ticketReservedTicketNumber
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventTicketReservedTicketNumber"));
}

- (void)setTicketReservedTicketSeatRow:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventTicketReservedTicketSeatRow"), 1);

}

- (NSString)ticketReservedTicketSeatRow
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventTicketReservedTicketSeatRow"));
}

- (void)setTicketReservedTicketSeatNumber:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventTicketReservedTicketSeatNumber"), 1);

}

- (NSString)ticketReservedTicketSeatNumber
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventTicketReservedTicketSeatNumber"));
}

- (void)setTicketReservedTicketSeatSection:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventTicketReservedTicketSeatSection"), 1);

}

- (NSString)ticketReservedTicketSeatSection
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventTicketReservedTicketSeatSection"));
}

- (void)setTicketStartDate:(id)a3
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", a3, CFSTR("kMDItemStartDate"));
}

- (NSDate)ticketStartDate
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemStartDate"));
}

- (void)setTicketStartTime:(id)a3
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", a3, CFSTR("kMDItemStartDate"));
}

- (NSDate)ticketStartTime
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemStartDate"));
}

- (void)setTicketEndDate:(id)a3
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", a3, CFSTR("kMDItemEndDate"));
}

- (NSDate)ticketEndDate
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEndDate"));
}

- (void)setTicketEndTime:(id)a3
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", a3, CFSTR("kMDItemEndDate"));
}

- (NSDate)ticketEndTime
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEndDate"));
}

- (void)setMovieReservationId:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventMovieReservationId"), 1);

}

- (NSString)movieReservationId
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventMovieReservationId"));
}

- (void)setMovieUnderName:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventMovieUnderName"), 1);

}

- (NSString)movieUnderName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventMovieUnderName"));
}

- (void)setMovieReservationForName:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventMovieReservationForName"), 1);

}

- (NSString)movieReservationForName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventMovieReservationForName"));
}

- (void)setMovieTimeZone:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventMovieTimeZone"), 1);

}

- (NSString)movieTimeZone
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventMovieTimeZone"));
}

- (void)setMovieReservationForLocationName:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventMovieReservationForLocationName"), 1);

}

- (NSString)movieReservationForLocationName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventMovieReservationForLocationName"));
}

- (void)setMovieReservationForLocationAddress:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventMovieReservationForLocationAddress"), 1);

}

- (NSString)movieReservationForLocationAddress
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventMovieReservationForLocationAddress"));
}

- (void)setMovieReservationForLocationAddressStreetAddress:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventMovieReservationForLocationAddressStreetAddress"), 1);

}

- (NSString)movieReservationForLocationAddressStreetAddress
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventMovieReservationForLocationAddressStreetAddress"));
}

- (void)setMovieReservationForLocationAddressLocality:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventMovieReservationForLocationAddressLocality"), 1);

}

- (NSString)movieReservationForLocationAddressLocality
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventMovieReservationForLocationAddressLocality"));
}

- (void)setMovieReservationForLocationAddressRegion:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventMovieReservationForLocationAddressRegion"), 1);

}

- (NSString)movieReservationForLocationAddressRegion
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventMovieReservationForLocationAddressRegion"));
}

- (void)setMovieReservationForLocationAddressPostalCode:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventMovieReservationForLocationAddressPostalCode"), 1);

}

- (NSString)movieReservationForLocationAddressPostalCode
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventMovieReservationForLocationAddressPostalCode"));
}

- (void)setMovieReservationForLocationAddressCountry:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventMovieReservationForLocationAddressCountry"), 1);

}

- (NSString)movieReservationForLocationAddressCountry
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventMovieReservationForLocationAddressCountry"));
}

- (void)setMovieReservedTicketNumber:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventMovieReservedTicketNumber"), 1);

}

- (NSString)movieReservedTicketNumber
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventMovieReservedTicketNumber"));
}

- (void)setMovieReservedTicketSeatRow:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventMovieReservedTicketSeatRow"), 1);

}

- (NSString)movieReservedTicketSeatRow
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventMovieReservedTicketSeatRow"));
}

- (void)setMovieReservedTicketSeatNumber:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventMovieReservedTicketSeatNumber"), 1);

}

- (NSString)movieReservedTicketSeatNumber
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventMovieReservedTicketSeatNumber"));
}

- (void)setMovieReservedTicketSeatSection:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventMovieReservedTicketSeatSection"), 1);

}

- (NSString)movieReservedTicketSeatSection
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventMovieReservedTicketSeatSection"));
}

- (void)setMovieStartDate:(id)a3
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", a3, CFSTR("kMDItemStartDate"));
}

- (NSDate)movieStartDate
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemStartDate"));
}

- (void)setMovieStartTime:(id)a3
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", a3, CFSTR("kMDItemStartDate"));
}

- (NSDate)movieStartTime
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemStartDate"));
}

- (void)setMovieEndDate:(id)a3
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", a3, CFSTR("kMDItemEndDate"));
}

- (NSDate)movieEndDate
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEndDate"));
}

- (void)setMovieEndTime:(id)a3
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", a3, CFSTR("kMDItemEndDate"));
}

- (NSDate)movieEndTime
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEndDate"));
}

- (void)setCarReservationId:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventCarReservationId"), 1);

}

- (NSString)carReservationId
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventCarReservationId"));
}

- (void)setCarUnderName:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventCarUnderName"), 1);

}

- (NSString)carUnderName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventCarUnderName"));
}

- (void)setCarReservationForName:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventCarReservationForName"), 1);

}

- (NSString)carReservationForName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventCarReservationForName"));
}

- (void)setCarReservationForModel:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventCarReservationForModel"), 1);

}

- (NSString)carReservationForModel
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventCarReservationForModel"));
}

- (void)setCarReservationForBrandName:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventCarReservationForBrandName"), 1);

}

- (NSString)carReservationForBrandName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventCarReservationForBrandName"));
}

- (void)setCarProviderName:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventCarProviderName"), 1);

}

- (NSString)carProviderName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventCarProviderName"));
}

- (void)setCarPickupTimeZone:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventCarPickupTimeZone"), 1);

}

- (NSString)carPickupTimeZone
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventCarPickupTimeZone"));
}

- (void)setCarPickupLocationName:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventCarPickupLocationName"), 1);

}

- (NSString)carPickupLocationName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventCarPickupLocationName"));
}

- (void)setCarPickupLocationTelephone:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventCarPickupLocationTelephone"), 1);

}

- (NSString)carPickupLocationTelephone
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventCarPickupLocationTelephone"));
}

- (void)setCarPickupLocationAddress:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventCarPickupLocationAddress"), 1);

}

- (NSString)carPickupLocationAddress
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventCarPickupLocationAddress"));
}

- (void)setCarPickupLocationAddressStreetAddress:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventCarPickupLocationAddressStreetAddress"), 1);

}

- (NSString)carPickupLocationAddressStreetAddress
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventCarPickupLocationAddressStreetAddress"));
}

- (void)setCarPickupLocationAddressLocality:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventCarPickupLocationAddressLocality"), 1);

}

- (NSString)carPickupLocationAddressLocality
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventCarPickupLocationAddressLocality"));
}

- (void)setCarPickupLocationAddressRegion:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventCarPickupLocationAddressRegion"), 1);

}

- (NSString)carPickupLocationAddressRegion
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventCarPickupLocationAddressRegion"));
}

- (void)setCarPickupLocationAddressPostalCode:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventCarPickupLocationAddressPostalCode"), 1);

}

- (NSString)carPickupLocationAddressPostalCode
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventCarPickupLocationAddressPostalCode"));
}

- (void)setCarDropoffTimeZone:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventCarDropoffTimeZone"), 1);

}

- (NSString)carDropoffTimeZone
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventCarDropoffTimeZone"));
}

- (void)setCarDropoffLocationName:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventCarDropoffLocationName"), 1);

}

- (NSString)carDropoffLocationName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventCarDropoffLocationName"));
}

- (void)setCarDropoffLocationTelephone:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventCarDropoffLocationTelephone"), 1);

}

- (NSString)carDropoffLocationTelephone
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventCarDropoffLocationTelephone"));
}

- (void)setCarDropoffLocationAddress:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventCarDropoffLocationAddress"), 1);

}

- (NSString)carDropoffLocationAddress
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventCarDropoffLocationAddress"));
}

- (void)setCarDropoffLocationAddressStreetAddress:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventCarDropoffLocationAddressStreetAddress"), 1);

}

- (NSString)carDropoffLocationAddressStreetAddress
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventCarDropoffLocationAddressStreetAddress"));
}

- (void)setCarDropoffLocationAddressLocality:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventCarDropoffLocationAddressLocality"), 1);

}

- (NSString)carDropoffLocationAddressLocality
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventCarDropoffLocationAddressLocality"));
}

- (void)setCarDropoffLocationAddressRegion:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventCarDropoffLocationAddressRegion"), 1);

}

- (NSString)carDropoffLocationAddressRegion
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventCarDropoffLocationAddressRegion"));
}

- (void)setCarDropoffLocationAddressPostalCode:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("kMDItemEventCarDropoffLocationAddressPostalCode"), 1);

}

- (NSString)carDropoffLocationAddressPostalCode
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEventCarDropoffLocationAddressPostalCode"));
}

- (void)setCarPickupDate:(id)a3
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", a3, CFSTR("kMDItemStartDate"));
}

- (NSDate)carPickupDate
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemStartDate"));
}

- (void)setCarPickupTime:(id)a3
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", a3, CFSTR("kMDItemStartDate"));
}

- (NSDate)carPickupTime
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemStartDate"));
}

- (void)setCarDropoffDate:(id)a3
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", a3, CFSTR("kMDItemEndDate"));
}

- (NSDate)carDropoffDate
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEndDate"));
}

- (void)setCarDropoffTime:(id)a3
{
  -[CSSearchableItemAttributeSet _setDateValue:forKey:](self, "_setDateValue:forKey:", a3, CFSTR("kMDItemEndDate"));
}

- (NSDate)carDropoffTime
{
  return (NSDate *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDItemEndDate"));
}

- (void)setAppEntityInstanceId:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemAppEntityInstanceIdentifier"), 1);

}

- (NSString)appEntityInstanceId
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemAppEntityInstanceIdentifier"));
}

- (void)setAppEntityType:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemAppEntityTypeIdentifier"), 1);

}

- (NSString)appEntityType
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemAppEntityTypeIdentifier"));
}

- (void)setAppEntityTypeRepresentationName:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemAppEntityTypeRepresentationName"), 1);

}

- (NSString)appEntityTypeRepresentationName
{
  return (NSString *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemAppEntityTypeRepresentationName"));
}

- (void)setAppEntityTypeRepresentationSynonyms:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v4, objc_opt_class(), CFSTR("_kMDItemAppEntityTypeRepresentationSynonyms"));

}

- (NSArray)appEntityTypeRepresentationSynonyms
{
  return (NSArray *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemAppEntityTypeRepresentationSynonyms"));
}

- (_CSEmbedding)secondaryTextEmbedding
{
  _CSEmbedding *v3;
  void *v4;
  _CSEmbedding *v5;

  v3 = [_CSEmbedding alloc];
  -[CSSearchableItemAttributeSet attributeForKey:](self, "attributeForKey:", CFSTR("_kMDItemSecondaryTextEmbedding"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_CSEmbedding initWithDictionaries:](v3, "initWithDictionaries:", v4);

  return v5;
}

- (void)setSecondaryTextEmbedding:(id)a3
{
  id v4;

  objc_msgSend(a3, "_asDictionaries");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet setAttribute:forKey:](self, "setAttribute:forKey:", v4, CFSTR("_kMDItemSecondaryTextEmbedding"));

}

- (_CSEmbedding)primaryTextEmbedding
{
  _CSEmbedding *v3;
  void *v4;
  _CSEmbedding *v5;

  v3 = [_CSEmbedding alloc];
  -[CSSearchableItemAttributeSet attributeForKey:](self, "attributeForKey:", CFSTR("_kMDItemPrimaryTextEmbedding"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_CSEmbedding initWithDictionaries:](v3, "initWithDictionaries:", v4);

  return v5;
}

- (void)setPrimaryTextEmbedding:(id)a3
{
  id v4;

  objc_msgSend(a3, "_asDictionaries");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet setAttribute:forKey:](self, "setAttribute:forKey:", v4, CFSTR("_kMDItemPrimaryTextEmbedding"));

}

- (_CSEmbedding)photoEmbedding
{
  _CSEmbedding *v3;
  void *v4;
  _CSEmbedding *v5;

  v3 = [_CSEmbedding alloc];
  -[CSSearchableItemAttributeSet attributeForKey:](self, "attributeForKey:", CFSTR("_kMDItemPhotoEmbedding"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_CSEmbedding initWithDictionaries:](v3, "initWithDictionaries:", v4);

  return v5;
}

- (void)setPhotoEmbedding:(id)a3
{
  id v4;

  objc_msgSend(a3, "_asDictionaries");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet setAttribute:forKey:](self, "setAttribute:forKey:", v4, CFSTR("_kMDItemPhotoEmbedding"));

}

- (void)setMediaEmbeddingVersion:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemMediaEmbeddingVersion"), 0);

}

- (NSNumber)mediaEmbeddingVersion
{
  return (NSNumber *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemMediaEmbeddingVersion"));
}

- (void)setMediaAnalysisTimeRangeEmbeddings:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v4, objc_opt_class(), CFSTR("_kMDItemMediaTimeRangeEmbeddings"), 0);

}

- (NSData)mediaAnalysisTimeRangeEmbeddings
{
  return (NSData *)-[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("_kMDItemMediaTimeRangeEmbeddings"));
}

- (void)_setValue:withClass:forKey:copy:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_7_1();
  v1 = OUTLINED_FUNCTION_0_4(v0);
  OUTLINED_FUNCTION_1_3(&dword_18C42F000, v2, v3, "Invalid value type:%@ for key:%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)_setDictionaryValue:withValueClass:keyClass:forKey:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_2_1(v0);
  OUTLINED_FUNCTION_4_1(&dword_18C42F000, v2, v3, "Invalid key value type:%@ for the item %@ in the dictionary for key:%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6_0();
}

- (void)_setDictionaryValue:withValueClass:keyClass:forKey:.cold.2()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_2_1(v0);
  OUTLINED_FUNCTION_4_1(&dword_18C42F000, v2, v3, "Invalid value type:%@ for the item %@ in the dictionary for key:%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6_0();
}

@end
