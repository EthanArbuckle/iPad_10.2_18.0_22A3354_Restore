@implementation MFMessageBody

- (id)rawData
{
  return -[MFMessage bodyData](self->_message, "bodyData");
}

- (id)contentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 asHTML:(BOOL)a5
{
  return -[MFMessageBody contentToOffset:resultOffset:asHTML:isComplete:](self, "contentToOffset:resultOffset:asHTML:isComplete:", a3, a4, a5, 0);
}

- (id)htmlContentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4
{
  return -[MFMessageBody contentToOffset:resultOffset:asHTML:](self, "contentToOffset:resultOffset:asHTML:", a3, a4, 1);
}

- (id)contentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 asHTML:(BOOL)a5 isComplete:(BOOL *)a6
{
  return 0;
}

- (id)htmlContent
{
  return -[MFMessageBody htmlContentToOffset:resultOffset:](self, "htmlContentToOffset:resultOffset:", 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (BOOL)isHTML
{
  return 0;
}

- (BOOL)isRich
{
  return 0;
}

- (void)setMessage:(id)a3
{
  id v5;

  v5 = a3;
  _MFLockGlobalLock();
  objc_storeStrong((id *)&self->_message, a3);
  _MFUnlockGlobalLock();

}

- (id)message
{
  return self->_message;
}

- (unsigned)numberOfAttachmentsSigned:(BOOL *)a3 encrypted:(BOOL *)a4
{
  return 0;
}

- (id)attachments
{
  NSObject *v2;
  uint8_t v4[16];

  MFLogGeneral();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1ABB13000, v2, OS_LOG_TYPE_INFO, "[MFMessageBody attachments]", v4, 2u);
  }

  return 0;
}

- (id)attachmentURLs
{
  NSObject *v2;
  uint8_t v4[16];

  MFLogGeneral();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1ABB13000, v2, OS_LOG_TYPE_INFO, "[MFMessageBody attachmentURLs]", v4, 2u);
  }

  return 0;
}

- (id)textHtmlPart
{
  return 0;
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
