@implementation CUIKRecentContactWithImage

- (EKStructuredLocation)location
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[CUIKRecentContactWithImage recent](self, "recent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[CUIKRecents recentIsDirectoryLocation:](CUIKRecents, "recentIsDirectoryLocation:", v3);

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    -[CUIKRecentContactWithImage recent](self, "recent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CUIKRecents locationForRecent:](CUIKRecents, "locationForRecent:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (EKStructuredLocation *)v5;
}

- (id)conferenceRoomForSource:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[CUIKRecentContactWithImage recent](self, "recent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[CUIKRecents recentIsDirectoryLocation:](CUIKRecents, "recentIsDirectoryLocation:", v5);

  if (v6)
  {
    -[CUIKRecentContactWithImage recent](self, "recent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CUIKRecents directoryLocationForRecent:onSource:](CUIKRecents, "directoryLocationForRecent:onSource:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setLocation:", v8);
    objc_msgSend(v9, "setAvailability:", 0);
    objc_msgSend(v4, "constraints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSupportsAvailability:", objc_msgSend(v10, "supportsAvailabilityRequests"));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v2;
  void *v3;

  -[CUIKRecentContactWithImage recent](self, "recent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CRRecentContact)recent
{
  return self->_recent;
}

- (void)setRecent:(id)a3
{
  objc_storeStrong((id *)&self->_recent, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_recent, 0);
}

@end
