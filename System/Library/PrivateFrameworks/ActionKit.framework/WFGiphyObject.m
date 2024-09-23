@implementation WFGiphyObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)allowedSecureCodingClassesByPropertyKey
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___WFGiphyObject;
  objc_msgSendSuper2(&v7, sel_allowedSecureCodingClassesByPropertyKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  v8[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("images"));

  v5 = (void *)objc_msgSend(v3, "copy");
  return v5;
}

+ (id)JSONKeyPathsByPropertyKey
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCE70], "mtl_identityPropertyMapWithModel:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setObject:forKey:", CFSTR("id"), CFSTR("objectId"));
  return v3;
}

+ (id)urlJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x24BDD1970], "mtl_URLValueTransformer");
}

+ (id)imagesJSONTransformer
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(MEMORY[0x24BEC3A08], "dictionaryTransformerWithModelClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BEC3A10];
  v4 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __38__WFGiphyObject_imagesJSONTransformer__block_invoke;
  v10[3] = &unk_24F8B2478;
  v11 = v2;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __38__WFGiphyObject_imagesJSONTransformer__block_invoke_2;
  v8[3] = &unk_24F8B2478;
  v9 = v11;
  v5 = v11;
  objc_msgSend(v3, "transformerUsingForwardBlock:reverseBlock:", v10, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)captionJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x24BEC3A10], "transformerUsingForwardBlock:", &__block_literal_global_12233);
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
        if (objc_msgSend(v10, "hasPrefix:", CFSTR("link.contentkit.giphy.")))
        {
          objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("link.contentkit.giphy."), &stru_24F8BBA48, 0, 0, objc_msgSend(CFSTR("link.contentkit.giphy."), "length"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqualToString:", CFSTR("images"))
            || objc_msgSend(v11, "isEqualToString:", CFSTR("type"))
            || objc_msgSend(v11, "isEqualToString:", CFSTR("url"))
            || objc_msgSend(v11, "isEqualToString:", CFSTR("id"))
            || objc_msgSend(v11, "isEqualToString:", CFSTR("caption")))
          {
            objc_msgSend(v5, "wfObjectOfClass:forKey:", objc_opt_class(), v10);
            v12 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v5, "objectForKey:", v10);
            v12 = objc_claimAutoreleasedReturnValue();
          }
          v13 = (void *)v12;
          if (v12)
            objc_msgSend(v4, "setObject:forKey:", v12, v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v7 = v14;
    }
    while (v14);
  }

  objc_msgSend(MEMORY[0x24BEC3A08], "modelOfClass:fromJSONDictionary:error:", a1, v4, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __39__WFGiphyObject_captionJSONTransformer__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "length"))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

id __38__WFGiphyObject_imagesJSONTransformer__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v14 = *(void **)(a1 + 32);
        objc_msgSend(v8, "objectForKey:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "transformedValue:success:error:", v15, a3, a4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setValue:forKey:", v16, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  return v7;
}

id __38__WFGiphyObject_imagesJSONTransformer__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v14 = *(void **)(a1 + 32);
        objc_msgSend(v8, "objectForKey:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "reverseTransformedValue:success:error:", v15, a3, a4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setValue:forKey:", v16, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)originalImage
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[WFGiphyObject images](self, "images");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("fixed_height"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[WFGiphyObject images](self, "images");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("fixed_height_small"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v6 = v8;
    }
    else
    {
      -[WFGiphyObject images](self, "images");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "allValues");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v6;
}

- (id)smallestImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[WFGiphyObject images](self, "images");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("fileSize > 0"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("fileSize"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)wfName
{
  void *v3;
  void *v4;

  -[WFGiphyObject caption](self, "caption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    -[WFGiphyObject caption](self, "caption");
  else
    -[WFGiphyObject objectId](self, "objectId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)wfSerializedRepresentation
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEC3A08], "JSONDictionaryFromModel:error:", self, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v9, (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("link.contentkit.giphy."), "stringByAppendingString:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v10, v11);

        objc_msgSend(v3, "removeObjectForKey:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  WFRemoveNull(v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)objectId
{
  return self->_objectId;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)caption
{
  return self->_caption;
}

- (NSURL)url
{
  return self->_url;
}

- (NSDictionary)images
{
  return self->_images;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_objectId, 0);
}

@end
