@implementation MADVIVisualSearchGatingResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVIVisualSearchGatingResult)initWithResultItems:(id)a3 andPayload:(id)a4
{
  id v7;
  id v8;
  MADVIVisualSearchGatingResult *v9;
  MADVIVisualSearchGatingResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MADVIVisualSearchGatingResult;
  v9 = -[MADResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resultItems, a3);
    objc_storeStrong((id *)&v10->_payload, a4);
  }

  return v10;
}

- (MADVIVisualSearchGatingResult)initWithCoder:(id)a3
{
  id v4;
  MADVIVisualSearchGatingResult *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *resultItems;
  uint64_t v11;
  NSData *payload;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MADVIVisualSearchGatingResult;
  v5 = -[MADResult initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ResultItems"));
    v9 = objc_claimAutoreleasedReturnValue();
    resultItems = v5->_resultItems;
    v5->_resultItems = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Payload"));
    v11 = objc_claimAutoreleasedReturnValue();
    payload = v5->_payload;
    v5->_payload = (NSData *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADVIVisualSearchGatingResult;
  v4 = a3;
  -[MADResult encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_resultItems, CFSTR("ResultItems"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_payload, CFSTR("Payload"));

}

- (BOOL)passedGating
{
  return -[NSArray count](self->_resultItems, "count") != 0;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("resultItems: %@, "), self->_resultItems);
  objc_msgSend(v3, "appendFormat:", CFSTR("payload: %@>"), self->_payload);
  return v3;
}

- (NSArray)resultItems
{
  return self->_resultItems;
}

- (NSData)payload
{
  return self->_payload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_resultItems, 0);
}

@end
