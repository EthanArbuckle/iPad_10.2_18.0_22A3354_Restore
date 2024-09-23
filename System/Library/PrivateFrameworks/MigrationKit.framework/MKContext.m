@implementation MKContext

- (MKContext)init
{
  MKContext *v2;
  MKImportContext *v3;
  MKImportContext *v4;
  MKImportContext *v5;
  MKImportContext *v6;
  MKImportContext *v7;
  MKImportContext *v8;
  MKImportContext *v9;
  MKImportContext *v10;
  MKImportContext *v11;
  MKImportContext *v12;
  MKImportContext *v13;
  MKImportContext *v14;
  MKImportContext *v15;
  MKImportContext *v16;
  MKImportContext *v17;
  MKImportContext *v18;
  MKImportContext *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)MKContext;
  v2 = -[MKContext init](&v21, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MKImportContext);
    -[MKContext setApplication:](v2, "setApplication:", v3);

    v4 = objc_alloc_init(MKImportContext);
    -[MKContext setAccount:](v2, "setAccount:", v4);

    v5 = objc_alloc_init(MKImportContext);
    -[MKContext setMessage:](v2, "setMessage:", v5);

    v6 = objc_alloc_init(MKImportContext);
    -[MKContext setContact:](v2, "setContact:", v6);

    v7 = objc_alloc_init(MKImportContext);
    -[MKContext setCallHistory:](v2, "setCallHistory:", v7);

    v8 = objc_alloc_init(MKImportContext);
    -[MKContext setCalendar:](v2, "setCalendar:", v8);

    v9 = objc_alloc_init(MKImportContext);
    -[MKContext setBookmark:](v2, "setBookmark:", v9);

    v10 = objc_alloc_init(MKImportContext);
    -[MKContext setFile:](v2, "setFile:", v10);

    v11 = objc_alloc_init(MKImportContext);
    -[MKContext setImage:](v2, "setImage:", v11);

    v12 = objc_alloc_init(MKImportContext);
    -[MKContext setVideo:](v2, "setVideo:", v12);

    v13 = objc_alloc_init(MKImportContext);
    -[MKContext setVoiceMemo:](v2, "setVoiceMemo:", v13);

    v14 = objc_alloc_init(MKImportContext);
    -[MKContext setAlbum:](v2, "setAlbum:", v14);

    v15 = objc_alloc_init(MKImportContext);
    -[MKContext setContainer:](v2, "setContainer:", v15);

    v16 = objc_alloc_init(MKImportContext);
    -[MKContext setAccessibilitySetting:](v2, "setAccessibilitySetting:", v16);

    v17 = objc_alloc_init(MKImportContext);
    -[MKContext setDisplaySetting:](v2, "setDisplaySetting:", v17);

    v18 = objc_alloc_init(MKImportContext);
    -[MKContext setPlaceholder:](v2, "setPlaceholder:", v18);

    v19 = objc_alloc_init(MKImportContext);
    -[MKContext setSim:](v2, "setSim:", v19);

  }
  return v2;
}

- (MKImportContext)application
{
  return self->_application;
}

- (void)setApplication:(id)a3
{
  objc_storeStrong((id *)&self->_application, a3);
}

- (MKImportContext)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (MKImportContext)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (MKImportContext)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (MKImportContext)callHistory
{
  return self->_callHistory;
}

- (void)setCallHistory:(id)a3
{
  objc_storeStrong((id *)&self->_callHistory, a3);
}

- (MKImportContext)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (MKImportContext)bookmark
{
  return self->_bookmark;
}

- (void)setBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_bookmark, a3);
}

- (MKImportContext)file
{
  return self->_file;
}

- (void)setFile:(id)a3
{
  objc_storeStrong((id *)&self->_file, a3);
}

- (MKImportContext)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (MKImportContext)video
{
  return self->_video;
}

- (void)setVideo:(id)a3
{
  objc_storeStrong((id *)&self->_video, a3);
}

- (MKImportContext)voiceMemo
{
  return self->_voiceMemo;
}

- (void)setVoiceMemo:(id)a3
{
  objc_storeStrong((id *)&self->_voiceMemo, a3);
}

- (MKImportContext)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_album, a3);
}

- (MKImportContext)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (MKImportContext)accessibilitySetting
{
  return self->_accessibilitySetting;
}

- (void)setAccessibilitySetting:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilitySetting, a3);
}

- (MKImportContext)displaySetting
{
  return self->_displaySetting;
}

- (void)setDisplaySetting:(id)a3
{
  objc_storeStrong((id *)&self->_displaySetting, a3);
}

- (MKImportContext)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
  objc_storeStrong((id *)&self->_placeholder, a3);
}

- (MKImportContext)sim
{
  return self->_sim;
}

- (void)setSim:(id)a3
{
  objc_storeStrong((id *)&self->_sim, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sim, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_displaySetting, 0);
  objc_storeStrong((id *)&self->_accessibilitySetting, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_voiceMemo, 0);
  objc_storeStrong((id *)&self->_video, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_callHistory, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end
