@implementation IRTTRpopup

- (IRTTRpopup)initWithHeader:(id)a3 key:(id)a4 message:(id)a5 defaultButton:(id)a6 otherButton:(id)a7 alternateButton:(id)a8 ttrWillOpen:(BOOL)a9 dismissWillStop:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  IRTTRpopup *v22;
  IRTTRpopup *v23;
  objc_super v25;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v25.receiver = self;
  v25.super_class = (Class)IRTTRpopup;
  v22 = -[IRTTRpopup init](&v25, sel_init);
  v23 = v22;
  if (v22)
  {
    -[IRTTRpopup setHeader:](v22, "setHeader:", v16);
    -[IRTTRpopup setKey:](v23, "setKey:", v17);
    -[IRTTRpopup setMessage:](v23, "setMessage:", v18);
    -[IRTTRpopup setDefaultButton:](v23, "setDefaultButton:", v19);
    -[IRTTRpopup setOtherButton:](v23, "setOtherButton:", v20);
    -[IRTTRpopup setAlternateButton:](v23, "setAlternateButton:", v21);
    -[IRTTRpopup setTtrWillOpen:](v23, "setTtrWillOpen:", a9);
    -[IRTTRpopup setDismissWillStop:](v23, "setDismissWillStop:", a10);
  }

  return v23;
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_storeStrong((id *)&self->_header, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (NSString)otherButton
{
  return self->_otherButton;
}

- (void)setOtherButton:(id)a3
{
  objc_storeStrong((id *)&self->_otherButton, a3);
}

- (NSString)defaultButton
{
  return self->_defaultButton;
}

- (void)setDefaultButton:(id)a3
{
  objc_storeStrong((id *)&self->_defaultButton, a3);
}

- (NSString)alternateButton
{
  return self->_alternateButton;
}

- (void)setAlternateButton:(id)a3
{
  objc_storeStrong((id *)&self->_alternateButton, a3);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (BOOL)ttrWillOpen
{
  return self->_ttrWillOpen;
}

- (void)setTtrWillOpen:(BOOL)a3
{
  self->_ttrWillOpen = a3;
}

- (BOOL)dismissWillStop
{
  return self->_dismissWillStop;
}

- (void)setDismissWillStop:(BOOL)a3
{
  self->_dismissWillStop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_alternateButton, 0);
  objc_storeStrong((id *)&self->_defaultButton, 0);
  objc_storeStrong((id *)&self->_otherButton, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

@end
