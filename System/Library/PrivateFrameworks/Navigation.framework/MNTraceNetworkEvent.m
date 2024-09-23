@implementation MNTraceNetworkEvent

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (unsigned __int8 *)v4;
    v6 = v5;
    if (self->_cellEnabled == v5[8] && self->_wifiEnabled == v5[9] && self->_nlcEnabled == v5[10])
      v7 = -[NSString isEqual:](self->_nlcProfile, "isEqual:", *((_QWORD *)v5 + 3));
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (BOOL)cellEnabled
{
  return self->_cellEnabled;
}

- (void)setCellEnabled:(BOOL)a3
{
  self->_cellEnabled = a3;
}

- (BOOL)wifiEnabled
{
  return self->_wifiEnabled;
}

- (void)setWifiEnabled:(BOOL)a3
{
  self->_wifiEnabled = a3;
}

- (BOOL)nlcEnabled
{
  return self->_nlcEnabled;
}

- (void)setNlcEnabled:(BOOL)a3
{
  self->_nlcEnabled = a3;
}

- (NSString)nlcProfile
{
  return self->_nlcProfile;
}

- (void)setNlcProfile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nlcProfile, 0);
}

@end
