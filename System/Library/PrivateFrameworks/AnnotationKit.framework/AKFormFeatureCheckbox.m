@implementation AKFormFeatureCheckbox

+ (id)checkboxWithRect:(CGRect)a3 onPage:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRect:onPage:", v9, x, y, width, height);

  return v10;
}

@end
