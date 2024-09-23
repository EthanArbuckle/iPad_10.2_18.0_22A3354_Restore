@implementation _NSGenerationTokenMapEntry

- (void)dealloc
{
  objc_super v3;

  self->_token = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSGenerationTokenMapEntry;
  -[_NSGenerationTokenMapEntry dealloc](&v3, sel_dealloc);
}

@end
