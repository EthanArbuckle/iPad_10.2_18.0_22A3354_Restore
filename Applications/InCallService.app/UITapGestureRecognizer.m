@implementation UITapGestureRecognizer

+ (void)addTapGestureRecognizerToView:(id)a3 withTarget:(id)a4 action:(SEL)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v7, a5);

  objc_msgSend(v8, "addGestureRecognizer:", v9);
}

+ (void)addTapGestureRecognizerToView:(id)a3 withTarget:(id)a4 action:(SEL)a5 tapCount:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;

  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v9, a5);

  objc_msgSend(v11, "setNumberOfTapsRequired:", a6);
  objc_msgSend(v10, "addGestureRecognizer:", v11);

}

+ (void)addTapGestureRecognizerToView:(id)a3 withTarget:(id)a4 action:(SEL)a5 tapCount:(unint64_t)a6 touchCount:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;

  v11 = a4;
  v12 = a3;
  v13 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v11, a5);

  objc_msgSend(v13, "setNumberOfTapsRequired:", a6);
  objc_msgSend(v13, "setNumberOfTouchesRequired:", a7);
  objc_msgSend(v12, "addGestureRecognizer:", v13);

}

@end
