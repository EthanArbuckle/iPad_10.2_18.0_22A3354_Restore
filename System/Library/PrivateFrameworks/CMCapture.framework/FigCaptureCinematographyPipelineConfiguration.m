@implementation FigCaptureCinematographyPipelineConfiguration

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureCinematographyPipelineConfiguration;
  -[FigCaptureCinematographyPipelineConfiguration dealloc](&v3, sel_dealloc);
}

- (void)setObjectMetadataIdentifiers:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 8);
}

@end
