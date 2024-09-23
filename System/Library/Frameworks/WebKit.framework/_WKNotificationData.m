@implementation _WKNotificationData

- (_WKNotificationData)initWithCoreData:(const void *)a3 dataStore:(id)a4
{
  _WKNotificationData *v5;
  void *v6;
  void *v7;
  void *m_ptr;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  WTF::StringImpl *v13;
  uint64_t v14;
  unint64_t v15;
  WTF::StringImpl *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_WKNotificationData;
  v5 = -[_WKNotificationData init](&v18, sel_init, a3, a4);
  if (v5)
  {
    v6 = (void *)WebCore::NotificationData::dictionaryRepresentation((WebCore::NotificationData *)a3);
    v7 = v6;
    if (v6)
      CFRetain(v6);
    m_ptr = v5->_dictionaryRepresentation.m_ptr;
    v5->_dictionaryRepresentation.m_ptr = v7;
    if (m_ptr)
      CFRelease(m_ptr);
    if (*((_QWORD *)a3 + 5))
      v9 = (__CFString *)WTF::StringImpl::operator NSString *();
    else
      v9 = &stru_1E351F1B8;
    v5->_title = (NSString *)v9;
    if (*((_QWORD *)a3 + 6))
      v10 = (__CFString *)WTF::StringImpl::operator NSString *();
    else
      v10 = &stru_1E351F1B8;
    v5->_body = (NSString *)v10;
    if (*((_QWORD *)a3 + 11))
      v11 = (__CFString *)WTF::StringImpl::operator NSString *();
    else
      v11 = &stru_1E351F1B8;
    v5->_origin = (NSString *)v11;
    WTF::UUID::toString((WTF::UUID *)((char *)a3 + 144));
    if (v17)
      v12 = (__CFString *)WTF::StringImpl::operator NSString *();
    else
      v12 = &stru_1E351F1B8;
    v5->_identifier = (NSString *)v12;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2)
        WTF::StringImpl::destroy(v17, v13);
      else
        *(_DWORD *)v17 -= 2;
    }
    v5->_userInfo = (NSDictionary *)(id)WebCore::NotificationData::dictionaryRepresentation((WebCore::NotificationData *)a3);
    v14 = 1;
    if (!*((_BYTE *)a3 + 224))
      v14 = 2;
    if (*((_BYTE *)a3 + 225))
      v15 = v14;
    else
      v15 = 0;
    v5->_alert = v15;
  }
  return v5;
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {

    v4.receiver = self;
    v4.super_class = (Class)_WKNotificationData;
    -[_WKNotificationData dealloc](&v4, sel_dealloc);
  }
}

- (id)dictionaryRepresentation
{
  return self->_dictionaryRepresentation.m_ptr;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)body
{
  return self->_body;
}

- (NSString)origin
{
  return self->_origin;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (unint64_t)alert
{
  return self->_alert;
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_dictionaryRepresentation.m_ptr;
  self->_dictionaryRepresentation.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
