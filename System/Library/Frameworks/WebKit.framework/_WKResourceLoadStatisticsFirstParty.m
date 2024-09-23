@implementation _WKResourceLoadStatisticsFirstParty

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::ResourceLoadStatisticsFirstParty::~ResourceLoadStatisticsFirstParty((WTF::StringImpl **)&self->_firstParty);
    v4.receiver = self;
    v4.super_class = (Class)_WKResourceLoadStatisticsFirstParty;
    -[_WKResourceLoadStatisticsFirstParty dealloc](&v4, sel_dealloc);
  }
}

- (NSString)firstPartyDomain
{
  if (*(_QWORD *)&self->_firstParty.data.__lx[16])
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (BOOL)storageAccess
{
  return self->_firstParty.data.__lx[24];
}

- (double)timeLastUpdated
{
  return *(double *)&self->_firstParty.data.__lx[32];
}

- (Object)_apiObject
{
  return (Object *)&self->_firstParty;
}

- (BOOL)thirdPartyStorageAccessGranted
{
  return self->_firstParty.data.__lx[40];
}

@end
