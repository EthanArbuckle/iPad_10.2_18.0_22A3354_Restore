@implementation AVTStickerTask

- (AVTStickerTask)initWithTask:(id)a3 avatarRecordIdentifier:(id)a4 indexPath:(id)a5 stickerType:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  AVTStickerTask *v13;
  uint64_t v14;
  id task;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AVTStickerTask;
  v13 = -[AVTStickerTask init](&v17, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    task = v13->_task;
    v13->_task = (id)v14;

    objc_storeStrong((id *)&v13->_avatarRecordIdentifier, a4);
    objc_storeStrong((id *)&v13->_indexPath, a5);
    v13->_stickerType = a6;
  }

  return v13;
}

+ (id)stickerTaskForSchedulerTask:(id)a3 avatarRecordIdentifier:(id)a4 indexPath:(id)a5 stickerType:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTask:avatarRecordIdentifier:indexPath:stickerType:", v11, v10, v9, a6);

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVTStickerTask;
  -[AVTStickerTask description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AVTStickerTask avatarRecordIdentifier](self, "avatarRecordIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" identifier: %@"), v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AVTStickerTask stickerType](self, "stickerType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" stickerType: %@"), v6);

  -[AVTStickerTask indexPath](self, "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AVTStickerTask indexPath](self, "indexPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" indexPath.row: %ld"), objc_msgSend(v8, "row"));

  }
  v9 = (void *)objc_msgSend(v4, "copy");

  return v9;
}

- (id)task
{
  return self->_task;
}

- (NSString)avatarRecordIdentifier
{
  return self->_avatarRecordIdentifier;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (unint64_t)stickerType
{
  return self->_stickerType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_avatarRecordIdentifier, 0);
  objc_storeStrong(&self->_task, 0);
}

@end
