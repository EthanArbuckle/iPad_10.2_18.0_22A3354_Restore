@implementation WKMouseTouchGestureRecognizer

- (WKMouseTouchGestureRecognizer)initWithInteraction:(id)a3
{
  WKMouseTouchGestureRecognizer *v4;
  WKMouseTouchGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKMouseTouchGestureRecognizer;
  v4 = -[WKMouseTouchGestureRecognizer init](&v7, sel_init);
  v5 = v4;
  if (v4)
    objc_storeWeak((id *)&v4->_interaction, a3);
  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[WKMouseTouchGestureRecognizer setState:](self, "setState:", 1, a4);
  objc_msgSend(objc_loadWeak((id *)&self->_interaction), "_updateMouseTouches:", a3);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  -[WKMouseTouchGestureRecognizer setState:](self, "setState:", 2, a4);
  objc_msgSend(objc_loadWeak((id *)&self->_interaction), "_updateMouseTouches:", a3);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[WKMouseTouchGestureRecognizer setState:](self, "setState:", 3, a4);
  objc_msgSend(objc_loadWeak((id *)&self->_interaction), "_updateMouseTouches:", a3);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[WKMouseTouchGestureRecognizer setState:](self, "setState:", 4, a4);
  objc_msgSend(objc_loadWeak((id *)&self->_interaction), "_updateMouseTouches:", a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_interaction);
}

@end
