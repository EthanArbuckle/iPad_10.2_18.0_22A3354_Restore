@implementation MADVIVisualSearchResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVIVisualSearchResult)initWithResultItems:(id)a3 andUserFeedbackPayload:(id)a4
{
  id v7;
  id v8;
  MADVIVisualSearchResult *v9;
  MADVIVisualSearchResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MADVIVisualSearchResult;
  v9 = -[MADResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resultItems, a3);
    objc_storeStrong((id *)&v10->_userFeedbackPayload, a4);
  }

  return v10;
}

- (MADVIVisualSearchResult)initWithCoder:(id)a3
{
  id v4;
  MADVIVisualSearchResult *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *resultItems;
  uint64_t v11;
  NSData *userFeedbackPayload;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MADVIVisualSearchResult;
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserFeedbackPayload"));
    v11 = objc_claimAutoreleasedReturnValue();
    userFeedbackPayload = v5->_userFeedbackPayload;
    v5->_userFeedbackPayload = (NSData *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADVIVisualSearchResult;
  v4 = a3;
  -[MADResult encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_resultItems, CFSTR("ResultItems"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_userFeedbackPayload, CFSTR("UserFeedbackPayload"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  -[NSArray description](self->_resultItems, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("resultItems: %@ "), v6);

  -[NSData description](self->_userFeedbackPayload, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("userFeedbackPayload: %@>"), v7);

  return v3;
}

- (NSArray)resultItems
{
  return self->_resultItems;
}

- (NSData)userFeedbackPayload
{
  return self->_userFeedbackPayload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userFeedbackPayload, 0);
  objc_storeStrong((id *)&self->_resultItems, 0);
}

@end
