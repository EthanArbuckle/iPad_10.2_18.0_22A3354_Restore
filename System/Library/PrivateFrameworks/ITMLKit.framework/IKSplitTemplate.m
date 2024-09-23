@implementation IKSplitTemplate

+ (id)supportedFeatures
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("leftNavigationDocument");
  v3[1] = CFSTR("rightNavigationDocument");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (IKSplitTemplate)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  IKSplitTemplate *v9;
  void *v10;
  uint64_t v11;
  NSString *displayMode;
  uint64_t v13;
  IKDOMFeatureNavigationDocument *leftNavigationDocument;
  uint64_t v15;
  IKDOMFeatureNavigationDocument *rightNavigationDocument;
  objc_super v18;

  v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)IKSplitTemplate;
  v9 = -[IKViewElement initWithDOMElement:parent:elementFactory:](&v18, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("mode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    displayMode = v9->_displayMode;
    v9->_displayMode = (NSString *)v11;

    -[IKSplitTemplate _featureWithName:](v9, "_featureWithName:", CFSTR("leftNavigationDocument"));
    v13 = objc_claimAutoreleasedReturnValue();
    leftNavigationDocument = v9->_leftNavigationDocument;
    v9->_leftNavigationDocument = (IKDOMFeatureNavigationDocument *)v13;

    -[IKSplitTemplate _featureWithName:](v9, "_featureWithName:", CFSTR("rightNavigationDocument"));
    v15 = objc_claimAutoreleasedReturnValue();
    rightNavigationDocument = v9->_rightNavigationDocument;
    v9->_rightNavigationDocument = (IKDOMFeatureNavigationDocument *)v15;

  }
  return v9;
}

- (id)_featureWithName:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IKViewElement features](self, "features");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "featureName", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSString)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (IKDOMFeatureNavigationDocument)leftNavigationDocument
{
  return self->_leftNavigationDocument;
}

- (IKDOMFeatureNavigationDocument)rightNavigationDocument
{
  return self->_rightNavigationDocument;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightNavigationDocument, 0);
  objc_storeStrong((id *)&self->_leftNavigationDocument, 0);
  objc_storeStrong((id *)&self->_displayMode, 0);
}

@end
