@implementation AMSEngagementPlacementInfo

- (id)makeRawDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSEngagementPlacementInfo placement](self, "placement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("placement"));

  -[AMSEngagementPlacementInfo context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C99E08];
  if (v5)
  {
    -[AMSEngagementPlacementInfo context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (-[AMSEngagementPlacementInfo supportsMultipleMessages](self, "supportsMultipleMessages"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSEngagementPlacementInfo supportsMultipleMessages](self, "supportsMultipleMessages"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("supportsMultipleMessages"));

  }
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("context"));

  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSDictionary)context
{
  return self->_context;
}

- (BOOL)supportsMultipleMessages
{
  return self->_supportsMultipleMessages;
}

- (NSString)placement
{
  return self->_placement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placement, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (AMSEngagementPlacementInfo)initWithPlacement:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  AMSEngagementPlacementInfo *v9;
  AMSEngagementPlacementInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSEngagementPlacementInfo;
  v9 = -[AMSEngagementPlacementInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_placement, a3);
    objc_storeStrong((id *)&v10->_context, a4);
    v10->_supportsMultipleMessages = 0;
  }

  return v10;
}

- (void)setSupportsMultipleMessages:(BOOL)a3
{
  self->_supportsMultipleMessages = a3;
}

@end
