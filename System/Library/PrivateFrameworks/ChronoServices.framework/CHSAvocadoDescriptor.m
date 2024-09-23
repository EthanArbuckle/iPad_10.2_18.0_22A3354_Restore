@implementation CHSAvocadoDescriptor

+ (void)load
{
  objc_msgSend(MEMORY[0x1E0CB3710], "setClass:forClassName:", objc_opt_class(), CFSTR("CHSAvocadoDescriptor"));
}

@end
