@implementation IKDOMCustomEvent

- (IKDOMCustomEvent)initWithType:(id)a3 eventInit:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  IKDOMCustomEvent *v17;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = a3;
  objc_msgSend(v8, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("on%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bubbles"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cancelable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("detail"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
    v14 = 0;
    v15 = 0;
  }
  +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[IKDOMCustomEvent initWithAppContext:type:xmlAttribute:canBubble:isCancelable:detail:](self, "initWithAppContext:type:xmlAttribute:canBubble:isCancelable:detail:", v16, v8, v10, v12, v14, v15);

  return v17;
}

- (IKDOMCustomEvent)initWithAppContext:(id)a3 type:(id)a4 xmlAttribute:(id)a5 canBubble:(BOOL)a6 isCancelable:(BOOL)a7 detail:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  IKDOMCustomEvent *v16;
  IKDOMCustomEvent *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v9 = a7;
  v10 = a6;
  v14 = a3;
  v15 = a8;
  v21.receiver = self;
  v21.super_class = (Class)IKDOMCustomEvent;
  v16 = -[IKDOMEvent initWithAppContext:type:xmlAttribute:canBubble:isCancelable:](&v21, sel_initWithAppContext_type_xmlAttribute_canBubble_isCancelable_, v14, a4, a5, v10, v9);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_detail, a8);
    objc_msgSend(v14, "jsContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "virtualMachine");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "addManagedReference:withOwner:", v15, v17);
  }

  return v17;
}

- (IKJSObject)detail
{
  return self->_detail;
}

- (void)setDetail:(id)a3
{
  objc_storeStrong((id *)&self->_detail, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);
}

@end
