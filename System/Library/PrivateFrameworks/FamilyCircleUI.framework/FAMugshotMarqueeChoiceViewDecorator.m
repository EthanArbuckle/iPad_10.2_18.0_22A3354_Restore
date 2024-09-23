@implementation FAMugshotMarqueeChoiceViewDecorator

+ (BOOL)shouldProcessObjectModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(a3, "defaultPages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "hasChoiceView"))
  {
    objc_msgSend(v5, "primaryElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(a1, "shouldProcessElement:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)shouldProcessElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = a3;
  objc_msgSend(v3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("familyAction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", CFSTR("InjectProfileImages")))
  {
    objc_msgSend(v3, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("altDSIDs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (FAMugshotMarqueeChoiceViewDecorator)initWithObjectModel:(id)a3 pictureStore:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  FAMugshotMarqueeChoiceViewDecorator *v10;

  v6 = a4;
  objc_msgSend(a3, "defaultPages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "primaryElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FAMugshotMarqueeChoiceViewDecorator initWithElement:pictureStore:](self, "initWithElement:pictureStore:", v9, v6);

  return v10;
}

- (FAMugshotMarqueeChoiceViewDecorator)initWithElement:(id)a3 pictureStore:(id)a4
{
  id v7;
  id v8;
  FAMugshotMarqueeChoiceViewDecorator *v9;
  FAMugshotMarqueeChoiceViewDecorator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FAMugshotMarqueeChoiceViewDecorator;
  v9 = -[FAMugshotMarqueeChoiceViewDecorator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_element, a3);
    objc_storeStrong((id *)&v10->_pictureStore, a4);
  }

  return v10;
}

- (id)altDSIDsFromString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C8A3000);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)imageWithAltDSIDs:(id)a3 familyCircle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__FAMugshotMarqueeChoiceViewDecorator_imageWithAltDSIDs_familyCircle___block_invoke;
  v10[3] = &unk_24C88C4C8;
  v11 = v5;
  v6 = v5;
  -[FAMugshotMarqueeChoiceViewDecorator pictureStore](self, "pictureStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FAMugshotMarqueeView imageWithMemberFilter:profilePictureStore:](FAMugshotMarqueeView, "imageWithMemberFilter:profilePictureStore:", v10, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __70__FAMugshotMarqueeChoiceViewDecorator_imageWithAltDSIDs_familyCircle___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "altDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (void)applyImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[FAMugshotMarqueeChoiceViewDecorator element](self, "element");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("altDSIDs"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[FAMugshotMarqueeChoiceViewDecorator altDSIDsFromString:](self, "altDSIDsFromString:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[FAMugshotMarqueeChoiceViewDecorator pictureStore](self, "pictureStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "familyCircle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAMugshotMarqueeChoiceViewDecorator imageWithAltDSIDs:familyCircle:](self, "imageWithAltDSIDs:familyCircle:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[FAMugshotMarqueeChoiceViewDecorator element](self, "element");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "size");
    objc_msgSend(v9, "setImageSize:");

    -[FAMugshotMarqueeChoiceViewDecorator element](self, "element");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", v8);

  }
}

- (RUIElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
  objc_storeStrong((id *)&self->_element, a3);
}

- (FAProfilePictureStore)pictureStore
{
  return self->_pictureStore;
}

- (void)setPictureStore:(id)a3
{
  objc_storeStrong((id *)&self->_pictureStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pictureStore, 0);
  objc_storeStrong((id *)&self->_element, 0);
}

@end
