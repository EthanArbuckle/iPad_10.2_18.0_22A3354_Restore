@implementation CKZKWQueryResult

- (CKZKWQueryResult)initWithSearchableItem:(id)a3 inSection:(id)a4 withConversation:(id)a5
{
  id v7;
  id v8;
  CKZKWQueryResult *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v7 = a4;
  v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKZKWQueryResult;
  v9 = -[CKZKWQueryResult init](&v15, sel_init);
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "chat");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "guid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@-%@"), v7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKSpotlightQueryResult setIdentifier:](v9, "setIdentifier:", v13);
    -[CKSpotlightQueryResult setConversation:](v9, "setConversation:", v8);

  }
  return v9;
}

@end
