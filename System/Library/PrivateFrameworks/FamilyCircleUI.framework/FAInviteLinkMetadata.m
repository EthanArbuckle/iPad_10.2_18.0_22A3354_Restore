@implementation FAInviteLinkMetadata

- (LPLinkMetadata)mailMetadata
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x24BDDA8B0]);
  -[FAInviteContext inviteURL](self->_context, "inviteURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOriginalURL:", v4);

  -[FAInviteContext inviteURL](self->_context, "inviteURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setURL:", v5);

  v6 = objc_alloc_init(MEMORY[0x24BDDA8E8]);
  -[FAInviteContext mailLinkTitle](self->_context, "mailLinkTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "setTitle:", v7);
  }
  else
  {
    -[FAInviteContext title](self->_context, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v8);

  }
  -[FAInviteLinkMetadata icon](self, "icon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIcon:", v9);

  -[FAInviteContext mailLinkSubtitle](self->_context, "mailLinkSubtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v6, "setApplication:", v10);
  }
  else
  {
    -[FAInviteContext secondaryTitle](self->_context, "secondaryTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setApplication:", v11);

  }
  objc_msgSend(v3, "setSpecialization:", v6);

  return (LPLinkMetadata *)v3;
}

- (LPLinkMetadata)bubbleMetadata
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = objc_alloc_init(MEMORY[0x24BDDA8B0]);
  -[FAInviteContext title](self->_context, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  -[FAInviteLinkMetadata image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v5);

  -[FAInviteContext action](self->_context, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSummary:", v6);

  -[FAInviteContext inviteURL](self->_context, "inviteURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOriginalURL:", v7);

  -[FAInviteContext inviteURL](self->_context, "inviteURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setURL:", v8);

  -[FAInviteContext eventType](self->_context, "eventType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE30948]))
  {

LABEL_4:
    v11 = objc_alloc_init(MEMORY[0x24BDDA8E0]);
    -[FAInviteContext title](self->_context, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v12);

    -[FAInviteContext subtitle](self->_context, "subtitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSubtitle:", v13);

    -[FAInviteContext action](self->_context, "action");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAction:", v14);

    objc_msgSend(v3, "image");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImage:", v15);

    -[FAInviteLinkMetadata icon](self, "icon");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIcon:", v16);

    -[FAInviteContext secondaryTitle](self->_context, "secondaryTitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setKind:", v17);

    objc_msgSend(v3, "setSpecialization:", v11);
    return (LPLinkMetadata *)v3;
  }
  -[FAInviteContext messageBubbleTitle](self->_context, "messageBubbleTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    goto LABEL_4;
  return (LPLinkMetadata *)v3;
}

- (FAInviteContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (LPImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (LPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
