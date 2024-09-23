@implementation CFURLResponseGetTypeID

uint64_t __CFURLResponseGetTypeID_block_invoke()
{
  NSURLResponse *v0;

  v0 = [NSURLResponse alloc];
  CFURLResponseGetTypeID::sID = CFGetTypeID(v0);

  return CFLog();
}

@end
