@implementation EABluetoothAccessoryPicker

+ (void)wakeSelectedBluetoothAccessories:(id)a3
{
  NSLog(CFSTR("[#BTPicker] ERROR: wakeSelectedBluetoothAccessories method is disabled!"), a2, a3);
}

- (EABluetoothAccessoryPicker)initWithPredicate:(id)a3
{
  EABluetoothAccessoryPicker *v4;
  __CFString *v5;
  BTDevicePicker *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EABluetoothAccessoryPicker;
  v4 = -[EABluetoothAccessoryPicker init](&v8, sel_init);
  if (v4)
  {
    v5 = +[EAPostAlert CopyLocalizedString:](EAPostAlert, "CopyLocalizedString:", CFSTR("BLUETOOTH_ACCESSORY_PICKER_TITLE"));
    if (!v5)
      v5 = &stru_1E6B07EE0;
    if (getBTDevicePickerClass())
    {
      v6 = (BTDevicePicker *)objc_msgSend(objc_alloc((Class)getBTDevicePickerClass()), "initWithTitle:service:discoveryNameFilter:", v5, 128, a3);
      v4->_picker = v6;
      -[BTDevicePicker setDelegate:](v6, "setDelegate:", v4);
    }
    else
    {
      NSLog(CFSTR("[#BTPicker] No BTDevicePicker class exists!"));
    }

  }
  return v4;
}

- (void)dealloc
{
  BTDevicePicker *picker;
  objc_super v4;

  picker = self->_picker;
  if (picker)
  {
    -[BTDevicePicker setDelegate:](picker, "setDelegate:", 0);

    self->_picker = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)EABluetoothAccessoryPicker;
  -[EABluetoothAccessoryPicker dealloc](&v4, sel_dealloc);
}

- (void)show
{
  -[BTDevicePicker setDelegate:](self->_picker, "setDelegate:", self);
  -[BTDevicePicker show](self->_picker, "show");
}

- (void)dismissPicker
{
  -[BTDevicePicker setDelegate:](self->_picker, "setDelegate:", 0);
  -[BTDevicePicker dismissAnimated:](self->_picker, "dismissAnimated:", 1);

  self->_picker = 0;
}

- (void)devicePicker:(id)a3 didDismissWithResult:(int64_t)a4 deviceAddress:(id)a5
{
  int64_t v8;

  if (self->_picker == a3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((unint64_t)(a4 - 1) >= 3)
      v8 = 0;
    else
      v8 = a4;
    -[EABluetoothAccessoryPickerDelegate devicePicker:didSelectAddress:errorCode:](self->_delegate, "devicePicker:didSelectAddress:errorCode:", self, a5, v8);
  }
}

- (EABluetoothAccessoryPickerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (EABluetoothAccessoryPickerDelegate *)a3;
}

@end
