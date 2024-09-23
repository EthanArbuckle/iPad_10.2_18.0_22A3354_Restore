@implementation MUITextEncapsulation

+ (id)messageListDateTextEncapsulationWithColor:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0CA80F0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setColor:", v4);

  objc_msgSend(v5, "setScale:", 0);
  objc_msgSend(v5, "setStyle:", 1);
  objc_msgSend(v5, "setPlatterSize:", 0);
  objc_msgSend(v5, "setShape:", 2);
  return v5;
}

@end
