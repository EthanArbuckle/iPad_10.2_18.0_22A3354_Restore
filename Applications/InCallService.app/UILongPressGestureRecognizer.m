@implementation UILongPressGestureRecognizer

+ (void)addLongPressGestureRecognizerToView:(id)a3 withTarget:(id)a4 action:(SEL)a5 minimumPressDuration:(double)a6 touchCount:(int64_t)a7
{
  id v11;
  id v12;
  id v13;

  v11 = a4;
  v12 = a3;
  v13 = objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", v11, a5);

  objc_msgSend(v13, "setMinimumPressDuration:", a6);
  objc_msgSend(v13, "setNumberOfTouchesRequired:", a7);
  objc_msgSend(v12, "addGestureRecognizer:", v13);

}

@end
