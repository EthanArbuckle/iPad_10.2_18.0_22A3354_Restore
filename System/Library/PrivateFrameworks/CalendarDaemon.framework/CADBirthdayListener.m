@implementation CADBirthdayListener

- (CADBirthdayListener)init
{
  CADBirthdayListener *v2;
  uint64_t v3;
  Class listenerClass;
  uint64_t v5;
  CalBirthdayListener *ekBirthdayListener;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CADBirthdayListener;
  v2 = -[CADBirthdayListener init](&v8, sel_init);
  if (v2)
  {
    EKWeakLinkClass();
    v3 = objc_claimAutoreleasedReturnValue();
    listenerClass = v2->_listenerClass;
    v2->_listenerClass = (Class)v3;

    -[objc_class sharedListener](v2->_listenerClass, "sharedListener");
    v5 = objc_claimAutoreleasedReturnValue();
    ekBirthdayListener = v2->_ekBirthdayListener;
    v2->_ekBirthdayListener = (CalBirthdayListener *)v5;

  }
  return v2;
}

+ (id)sharedListener
{
  if (sharedListener_onceToken != -1)
    dispatch_once(&sharedListener_onceToken, &__block_literal_global_24);
  return (id)sharedListener__sharedListener;
}

void __37__CADBirthdayListener_sharedListener__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedListener__sharedListener;
  sharedListener__sharedListener = v0;

}

+ (void)start
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v2 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B6A18000, v2, OS_LOG_TYPE_DEBUG, "Starting birthday manager", v4, 2u);
  }
  +[CADBirthdayListener sharedListener](CADBirthdayListener, "sharedListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");

}

+ (void)reset
{
  id v2;

  +[CADBirthdayListener sharedListener](CADBirthdayListener, "sharedListener");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

}

- (void)start
{
  id v2;

  -[CADBirthdayListener ekBirthdayListener](self, "ekBirthdayListener");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "start");

}

- (void)reset
{
  id v2;

  -[CADBirthdayListener ekBirthdayListener](self, "ekBirthdayListener");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

}

- (void)setBirthdayCalendarEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[CADBirthdayListener ekBirthdayListener](self, "ekBirthdayListener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "addBirthdayCalendars");
  else
    objc_msgSend(v4, "disableBirthdayCalendars");

}

- (BOOL)birthdayCalendarEnabled
{
  return -[objc_class areBirthdaysEnabled](self->_listenerClass, "areBirthdaysEnabled");
}

+ (void)setBirthdayCalendarEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[CADBirthdayListener sharedListener](CADBirthdayListener, "sharedListener");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBirthdayCalendarEnabled:", v3);

}

+ (BOOL)birthdayCalendarEnabled
{
  void *v2;
  char v3;

  +[CADBirthdayListener sharedListener](CADBirthdayListener, "sharedListener");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "birthdayCalendarEnabled");

  return v3;
}

- (CalBirthdayListener)ekBirthdayListener
{
  return self->_ekBirthdayListener;
}

- (void)setEkBirthdayListener:(id)a3
{
  objc_storeStrong((id *)&self->_ekBirthdayListener, a3);
}

- (Class)listenerClass
{
  return self->_listenerClass;
}

- (void)setListenerClass:(Class)a3
{
  objc_storeStrong((id *)&self->_listenerClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerClass, 0);
  objc_storeStrong((id *)&self->_ekBirthdayListener, 0);
}

@end
