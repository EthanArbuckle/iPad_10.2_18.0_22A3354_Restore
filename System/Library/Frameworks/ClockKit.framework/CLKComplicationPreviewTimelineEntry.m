@implementation CLKComplicationPreviewTimelineEntry

- (CLKComplicationPreviewTimelineEntry)init
{
  CLKComplicationPreviewTimelineEntry *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKComplicationPreviewTimelineEntry;
  v2 = -[CLKComplicationPreviewTimelineEntry init](&v6, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[CLKComplicationPreviewTimelineEntry setErrors:](v2, "setErrors:", v3);

    v4 = (void *)objc_opt_new();
    -[CLKComplicationPreviewTimelineEntry setSelectableRegions:](v2, "setSelectableRegions:", v4);

  }
  return v2;
}

- (void)finalize
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLKComplicationPreviewTimelineEntry;
  -[CLKComplicationTimelineEntry finalize](&v4, sel_finalize);
  -[CLKComplicationTimelineEntry complicationTemplate](self, "complicationTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRenderForPreviews:", 1);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKComplicationPreviewTimelineEntry;
  v4 = a3;
  -[CLKComplicationTimelineEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_previewFaceColor, CFSTR("previewFaceColor"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_errors, CFSTR("errors"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_selectableRegions, CFSTR("selectableRegions"));

}

- (CLKComplicationPreviewTimelineEntry)initWithCoder:(id)a3
{
  id v4;
  CLKComplicationPreviewTimelineEntry *v5;
  uint64_t v6;
  NSArray *errors;
  uint64_t v8;
  NSArray *selectableRegions;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationPreviewTimelineEntry;
  v5 = -[CLKComplicationTimelineEntry initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_previewFaceColor = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("previewFaceColor"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("errors"));
    v6 = objc_claimAutoreleasedReturnValue();
    errors = v5->_errors;
    v5->_errors = (NSArray *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectableRegions"));
    v8 = objc_claimAutoreleasedReturnValue();
    selectableRegions = v5->_selectableRegions;
    v5->_selectableRegions = (NSArray *)v8;

  }
  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)CLKComplicationPreviewTimelineEntry;
  -[CLKComplicationTimelineEntry description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ preview face color = %ld"), v4, self->_previewFaceColor);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  objc_super v7;

  if (-[CLKComplicationTimelineEntry finalized](self, "finalized"))
    return self;
  v7.receiver = self;
  v7.super_class = (Class)CLKComplicationPreviewTimelineEntry;
  v5 = -[CLKComplicationTimelineEntry copyWithZone:](&v7, sel_copyWithZone_, a3);
  objc_msgSend(v5, "setPreviewFaceColor:", self->_previewFaceColor);
  objc_msgSend(v5, "setErrors:", self->_errors);
  objc_msgSend(v5, "setSelectableRegions:", self->_selectableRegions);
  return v5;
}

- (int64_t)previewFaceColor
{
  return self->_previewFaceColor;
}

- (void)setPreviewFaceColor:(int64_t)a3
{
  self->_previewFaceColor = a3;
}

- (NSArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)selectableRegions
{
  return self->_selectableRegions;
}

- (void)setSelectableRegions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectableRegions, 0);
  objc_storeStrong((id *)&self->_errors, 0);
}

@end
