@implementation MRContentItemRequest

- (MRContentItem)item
{
  return self->_item;
}

- (MRContentItemRequest)initWithItem:(id)a3 request:(id)a4
{
  id v6;
  id v7;
  MRContentItemRequest *v8;
  uint64_t v9;
  MRPlaybackQueueRequest *request;
  MRContentItem *v11;
  MRContentItem *item;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MRContentItemRequest;
  v8 = -[MRContentItemRequest init](&v18, sel_init);
  if (v8)
  {
    if (v6)
    {
      if (v7)
      {
LABEL_4:
        v9 = objc_msgSend(v7, "copy");
        request = v8->_request;
        v8->_request = (MRPlaybackQueueRequest *)v9;

        v11 = (MRContentItem *)MRContentItemCreateFromRequest(v6, v8->_request);
        item = v8->_item;
        v8->_item = v11;

        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRContentItemRequest initWithItem:request:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("MRContentItemRequest.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

      if (v7)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRContentItemRequest initWithItem:request:]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("MRContentItemRequest.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

    goto LABEL_4;
  }
LABEL_5:

  return v8;
}

- (MRPlaybackQueueRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

- (void)setItem:(id)a3
{
  MRContentItem *MergedItem;
  MRContentItem *item;

  MergedItem = (MRContentItem *)MRContentItemCreateMergedItem(self->_item, a3);
  item = self->_item;
  self->_item = MergedItem;

}

- (void)setRequest:(id)a3
{
  -[MRPlaybackQueueRequest mergeFrom:](self->_request, "mergeFrom:", a3);
}

- (MRContentItemRequest)initWithCoder:(id)a3
{
  id v4;
  MRContentItemRequest *v5;
  void *v6;
  MRContentItem *v7;
  MRContentItem *item;
  void *v9;
  MRPlaybackQueueRequest *v10;
  MRPlaybackQueueRequest *request;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MRContentItemRequest;
  v5 = -[MRContentItemRequest init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("1"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRContentItemRequest initWithCoder:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("MRContentItemRequest.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemData"));

    }
    v7 = MRContentItemCreateFromExternalRepresentation(*MEMORY[0x1E0C9AE00], (uint64_t)v6);
    item = v5->_item;
    v5->_item = v7;

    if (!v5->_item)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRContentItemRequest initWithCoder:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("MRContentItemRequest.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_item"));

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("0"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRContentItemRequest initWithCoder:]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("MRContentItemRequest.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestData"));

    }
    v10 = -[MRPlaybackQueueRequest initWithData:]([MRPlaybackQueueRequest alloc], "initWithData:", v9);
    request = v5->_request;
    v5->_request = v10;

    if (!v5->_request)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRContentItemRequest initWithCoder:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("MRContentItemRequest.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_request"));

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  MRContentItem *item;
  id v5;
  void *v6;
  id ExternalRepresentation;

  item = self->_item;
  v5 = a3;
  ExternalRepresentation = (id)MRContentItemCreateExternalRepresentation(0, item);
  objc_msgSend(v5, "encodeObject:forKey:", ExternalRepresentation, CFSTR("1"));
  -[MRPlaybackQueueRequest data](self->_request, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("0"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p {\n  request = %@  item = %@}"), objc_opt_class(), self, self->_request, self->_item);
}

@end
