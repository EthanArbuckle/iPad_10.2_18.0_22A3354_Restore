@implementation AVContentKeyRequestInternal

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->weakSession);
}

@end
