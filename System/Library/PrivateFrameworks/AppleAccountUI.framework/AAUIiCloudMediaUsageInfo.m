@implementation AAUIiCloudMediaUsageInfo

- (AAUIiCloudMediaUsageInfo)initWithMediaType:(id)a3 representativeColor:(id)a4 bytesUsed:(float)a5
{
  id v9;
  id v10;
  AAUIiCloudMediaUsageInfo *v11;
  AAUIiCloudMediaUsageInfo *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AAUIiCloudMediaUsageInfo;
  v11 = -[AAUIiCloudMediaUsageInfo init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaType, a3);
    objc_storeStrong((id *)&v12->_representativeColor, a4);
    v12->_bytesUsed = a5;
  }

  return v12;
}

- (NSString)displayLabel
{
  NSString *displayLabel;

  displayLabel = self->_displayLabel;
  if (!displayLabel)
    displayLabel = self->_mediaType;
  return displayLabel;
}

- (id)capacityBarCatagory
{
  id v3;
  NSString *displayLabel;

  v3 = objc_alloc(MEMORY[0x1E0D80478]);
  if (self->_displayLabel)
    displayLabel = self->_displayLabel;
  else
    displayLabel = self->_mediaType;
  return (id)objc_msgSend(v3, "initWithIdentifier:title:color:bytes:", self->_mediaType, displayLabel, self->_representativeColor, (uint64_t)self->_bytesUsed);
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
  objc_storeStrong((id *)&self->_mediaType, a3);
}

- (UIColor)representativeColor
{
  return self->_representativeColor;
}

- (void)setRepresentativeColor:(id)a3
{
  objc_storeStrong((id *)&self->_representativeColor, a3);
}

- (float)bytesUsed
{
  return self->_bytesUsed;
}

- (void)setBytesUsed:(float)a3
{
  self->_bytesUsed = a3;
}

- (void)setDisplayLabel:(id)a3
{
  objc_storeStrong((id *)&self->_displayLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLabel, 0);
  objc_storeStrong((id *)&self->_representativeColor, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
}

@end
