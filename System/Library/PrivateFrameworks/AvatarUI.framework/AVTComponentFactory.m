@implementation AVTComponentFactory

+ (id)alertActionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", a3, a4, a5);
}

@end
