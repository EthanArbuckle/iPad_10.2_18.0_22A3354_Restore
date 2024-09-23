@implementation GEORequestResponseMetadataFile

- (id)initForReadWithFileDescriptor:(int)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GEORequestResponseMetadataFile;
  return -[GEOAnalyticsDataFile initForReadWithFileMagic:fileDescriptor:](&v4, sel_initForReadWithFileMagic_fileDescriptor_, 195944097, *(_QWORD *)&a3);
}

- (id)initForReadWithFilePath:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GEORequestResponseMetadataFile;
  return -[GEOAnalyticsDataFile initForReadWithFileMagic:filePath:](&v4, sel_initForReadWithFileMagic_filePath_, 195944097, a3);
}

- (id)initForWriteWithFilePath:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GEORequestResponseMetadataFile;
  return -[GEOAnalyticsDataFile initForWriteWithFileMagic:filePath:](&v4, sel_initForWriteWithFileMagic_filePath_, 195944097, a3);
}

- (BOOL)writeRequestResponseMetadata:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GEORequestResponseMetadataFile;
  return -[GEOAnalyticsDataFile writeAnalyticData:](&v4, sel_writeAnalyticData_, a3);
}

- (BOOL)unsafe_readReqRespMetadataWithVisitorBlock:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GEORequestResponseMetadataFile;
  return -[GEOAnalyticsDataFile unsafe_readAnalyticDataWithVisitorBlock:](&v4, sel_unsafe_readAnalyticDataWithVisitorBlock_, a3);
}

@end
