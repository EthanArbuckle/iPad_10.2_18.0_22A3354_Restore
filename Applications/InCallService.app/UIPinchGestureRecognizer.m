@implementation UIPinchGestureRecognizer

+ (void)addPinchGestureRecognizerToView:(id)a3 withTarget:(id)a4 action:(SEL)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend(objc_alloc((Class)UIPinchGestureRecognizer), "initWithTarget:action:", v7, a5);

  objc_msgSend(v8, "addGestureRecognizer:", v9);
}

@end
