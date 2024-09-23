@implementation IDSPopupPrompt

- (IDSPopupPrompt)initWithTitle:(id)a3 promptMessage:(id)a4
{
  id v6;
  id v7;
  IDSPopupPrompt *v8;
  const char *v9;
  double v10;
  IDSPopupPrompt *v11;
  const char *v12;
  double v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IDSPopupPrompt;
  v8 = -[IDSPopupPrompt init](&v15, sel_init);
  v11 = v8;
  if (v8)
  {
    objc_msgSend_setTitle_(v8, v9, (uint64_t)v6, v10);
    objc_msgSend_setMessage_(v11, v12, (uint64_t)v7, v13);
  }

  return v11;
}

- (void)launchPromptWithButton:(id)a3 defaultUrl:(id)a4 alternateButton:(id)a5 alternateUrl:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  __CFString *title;
  __CFString *v15;
  __CFString *message;
  __CFString *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  double v28;
  void *v29;
  const char *v30;
  double v31;
  _QWORD v32[4];
  id v33;
  id v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (qword_1EE40AFC8 != -1)
    dispatch_once(&qword_1EE40AFC8, &unk_1E3C1B650);
  title = (__CFString *)self->_title;
  if (!title)
    title = CFSTR("Internal IDS Error Detected");
  v15 = title;
  message = (__CFString *)self->_message;
  if (!message)
    message = CFSTR("An internal IDS error has been detected");
  v17 = message;
  v18 = (void *)MEMORY[0x1E0D36B00];
  objc_msgSend_stringGUID(MEMORY[0x1E0CB3940], v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userNotificationWithIdentifier_title_message_defaultButton_alternateButton_otherButton_(v18, v23, (uint64_t)v22, v24, v15, v17, v10, v12, CFSTR("Dismiss"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend_sharedInstance(MEMORY[0x1E0D36B08], v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = sub_19B97ED8C;
    v32[3] = &unk_1E3C1C778;
    v33 = v11;
    v34 = v13;
    objc_msgSend_addUserNotification_listener_completionHandler_(v29, v30, (uint64_t)v25, v31, 0, v32);

  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
