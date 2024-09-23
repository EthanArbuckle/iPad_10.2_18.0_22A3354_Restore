@implementation IMExpressiveSendAsTextChatItem

- (id)_initWithItem:(id)a3 text:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMExpressiveSendAsTextChatItem;
  v8 = -[IMChatItem _initWithItem:](&v14, sel__initWithItem_, v6);
  if (v8)
  {
    objc_msgSend(v6, "guid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)sub_1A2132A84();

    objc_msgSend(v8, "_setGUID:", v10);
    v11 = objc_msgSend(v7, "copy");
    v12 = (void *)v8[7];
    v8[7] = v11;

  }
  return v8;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
