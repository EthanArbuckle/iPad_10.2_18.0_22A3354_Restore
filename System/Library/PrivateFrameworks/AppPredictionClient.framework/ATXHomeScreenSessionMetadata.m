@implementation ATXHomeScreenSessionMetadata

- (ATXHomeScreenSessionMetadata)initWithWidgetUniqueId:(id)a3 widgetBundleId:(id)a4 isWidgetInTodayView:(BOOL)a5
{
  id v9;
  id v10;
  ATXHomeScreenSessionMetadata *v11;
  ATXHomeScreenSessionMetadata *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXHomeScreenSessionMetadata;
  v11 = -[ATXHomeScreenSessionMetadata init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_widgetUniqueId, a3);
    objc_storeStrong((id *)&v12->_widgetBundleId, a4);
    v12->_isWidgetInTodayView = a5;
  }

  return v12;
}

- (NSString)description
{
  void *v3;
  id v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1A85A4F90](self, a2);
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (self->_isWidgetInTodayView)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@: \nwidgetUniqueId: %@ \nwidgetBundleId: %@ \nisWidgetInTodayView: %@ \n"), v6, self->_widgetBundleId, self->_widgetUniqueId, v8);

  objc_autoreleasePoolPop(v3);
  return (NSString *)v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *widgetUniqueId;
  id v5;

  widgetUniqueId = self->_widgetUniqueId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", widgetUniqueId, CFSTR("widgetUniqueId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_widgetBundleId, CFSTR("widgetBundleId"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isWidgetInTodayView, CFSTR("widgetTodayView"));

}

- (ATXHomeScreenSessionMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  ATXHomeScreenSessionMetadata *v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_feedback();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("widgetUniqueId"), v4, 1, CFSTR("com.apple.ATXFeedbackSessionMetadata"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0D81610];
    v10 = objc_opt_class();
    __atxlog_handle_feedback();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v10, CFSTR("widgetBundleId"), v4, 1, CFSTR("com.apple.ATXFeedbackSessionMetadata"), -1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      self = -[ATXHomeScreenSessionMetadata initWithWidgetUniqueId:widgetBundleId:isWidgetInTodayView:](self, "initWithWidgetUniqueId:widgetBundleId:isWidgetInTodayView:", v8, v12, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("widgetTodayView")));
      v13 = self;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_widgetUniqueId, "hash");
  v4 = -[NSString hash](self->_widgetBundleId, "hash");
  return self->_isWidgetInTodayView - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
}

- (BOOL)isEqual:(id)a3
{
  ATXHomeScreenSessionMetadata *v4;
  ATXHomeScreenSessionMetadata *v5;
  BOOL v6;

  v4 = (ATXHomeScreenSessionMetadata *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXHomeScreenSessionMetadata isEqualToATXHomeScreenSessionMetadata:](self, "isEqualToATXHomeScreenSessionMetadata:", v5);

  return v6;
}

- (BOOL)isEqualToATXHomeScreenSessionMetadata:(id)a3
{
  id *v4;
  NSString *widgetUniqueId;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSString *widgetBundleId;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  BOOL v15;

  v4 = (id *)a3;
  widgetUniqueId = self->_widgetUniqueId;
  v6 = (NSString *)v4[2];
  if (widgetUniqueId == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = widgetUniqueId;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_7;
  }
  widgetBundleId = self->_widgetBundleId;
  v11 = (NSString *)v4[3];
  if (widgetBundleId == v11)
  {

    goto LABEL_9;
  }
  v12 = v11;
  v13 = widgetBundleId;
  v14 = -[NSString isEqual:](v13, "isEqual:", v12);

  if ((v14 & 1) != 0)
  {
LABEL_9:
    v15 = self->_isWidgetInTodayView == *((unsigned __int8 *)v4 + 8);
    goto LABEL_10;
  }
LABEL_7:
  v15 = 0;
LABEL_10:

  return v15;
}

- (NSString)widgetUniqueId
{
  return self->_widgetUniqueId;
}

- (void)setWidgetUniqueId:(id)a3
{
  objc_storeStrong((id *)&self->_widgetUniqueId, a3);
}

- (NSString)widgetBundleId
{
  return self->_widgetBundleId;
}

- (void)setWidgetBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_widgetBundleId, a3);
}

- (BOOL)isWidgetInTodayView
{
  return self->_isWidgetInTodayView;
}

- (void)setIsWidgetInTodayView:(BOOL)a3
{
  self->_isWidgetInTodayView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetBundleId, 0);
  objc_storeStrong((id *)&self->_widgetUniqueId, 0);
}

@end
