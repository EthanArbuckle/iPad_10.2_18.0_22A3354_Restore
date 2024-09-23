@implementation SWCachedHighlightEvent

+ (id)cachedEvent:(id)a3 forHighlight:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEvent:forHighlight:", v7, v6);

  return v8;
}

- (SWCachedHighlightEvent)initWithEvent:(id)a3 forHighlight:(id)a4
{
  id v7;
  id v8;
  SWCachedHighlightEvent *v9;
  SWCachedHighlightEvent *v10;
  uint64_t v11;
  NSUUID *uuid;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SWCachedHighlightEvent;
  v9 = -[SWCachedHighlightEvent init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_event, a3);
    objc_storeStrong((id *)&v10->_highlight, a4);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = objc_claimAutoreleasedReturnValue();
    uuid = v10->_uuid;
    v10->_uuid = (NSUUID *)v11;

  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[SWCachedHighlightEvent event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCachedHighlightEvent highlight](self, "highlight");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithEvent:forHighlight:", v5, v6);

  return v7;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (SWHighlightEvent)event
{
  return self->_event;
}

- (SWHighlight)highlight
{
  return self->_highlight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
