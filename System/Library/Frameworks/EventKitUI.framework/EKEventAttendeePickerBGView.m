@implementation EKEventAttendeePickerBGView

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void (**boundsChangeCallback)(void);
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[EKEventAttendeePickerBGView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v16.receiver = self;
  v16.super_class = (Class)EKEventAttendeePickerBGView;
  -[EKEventAttendeePickerBGView setBounds:](&v16, sel_setBounds_, x, y, width, height);
  -[EKEventAttendeePickerBGView bounds](self, "bounds");
  if (v9 != v13 || v11 != v12)
  {
    boundsChangeCallback = (void (**)(void))self->_boundsChangeCallback;
    if (boundsChangeCallback)
      boundsChangeCallback[2]();
  }
}

- (id)boundsChangeCallback
{
  return self->_boundsChangeCallback;
}

- (void)setBoundsChangeCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_boundsChangeCallback, 0);
}

@end
