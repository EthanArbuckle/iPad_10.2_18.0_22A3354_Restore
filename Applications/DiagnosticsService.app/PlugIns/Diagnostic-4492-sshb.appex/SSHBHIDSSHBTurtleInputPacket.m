@implementation SSHBHIDSSHBTurtleInputPacket

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDSSHBTurtleInputPacket descriptionDictionary](self, "descriptionDictionary"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v9));
        objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@\n"), v9, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  objc_msgSend(v3, "deleteCharactersInRange:", (char *)objc_msgSend(v3, "length") - 1, 1);

  return v3;
}

- (id)descriptionDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", -[SSHBHIDSSHBTurtleInputPacket reportID](self, "reportID")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("reportID"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", -[SSHBHIDSSHBTurtleInputPacket frameNumber](self, "frameNumber")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("frameNumber"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[SSHBHIDSSHBTurtleInputPacket timestamp](self, "timestamp")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("timestamp"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", -[SSHBHIDSSHBTurtleInputPacket cookie_type](self, "cookie_type")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("cookie_type"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", -[SSHBHIDSSHBTurtleInputPacket cookie](self, "cookie")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("cookie"));

  v9 = objc_opt_self(self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", objc_msgSend(v10, "capValue")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("capValue"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[SSHBHIDSSHBTurtleInputPacket gapValue](self, "gapValue")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("gapValue"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", -[SSHBHIDSSHBTurtleInputPacket forceValue](self, "forceValue")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("forceValue"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", -[SSHBHIDSSHBTurtleInputPacket mesaTemperature](self, "mesaTemperature")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("mesaTemperature"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", -[SSHBHIDSSHBTurtleInputPacket mesaFd](self, "mesaFd")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("mesaFd"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", -[SSHBHIDSSHBTurtleInputPacket mesaFdStuck](self, "mesaFdStuck")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("mesaFdStuck"));

  -[SSHBHIDSSHBTurtleInputPacket mesaTemperatureProcessed](self, "mesaTemperatureProcessed");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("mesaTemperatureProcessed"));

  return v3;
}

- (unsigned)capValue
{
  return self->_capValue;
}

- (void)setCapValue:(unsigned __int16)a3
{
  self->_capValue = a3;
}

- (int)gapValue
{
  return self->_gapValue;
}

- (void)setGapValue:(int)a3
{
  self->_gapValue = a3;
}

- (signed)forceValue
{
  return self->_forceValue;
}

- (void)setForceValue:(signed __int16)a3
{
  self->_forceValue = a3;
}

- (unsigned)reportID
{
  return self->_reportID;
}

- (void)setReportID:(unsigned __int8)a3
{
  self->_reportID = a3;
}

- (unsigned)frameNumber
{
  return self->_frameNumber;
}

- (void)setFrameNumber:(unsigned __int8)a3
{
  self->_frameNumber = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unsigned)cookie_type
{
  return self->_cookie_type;
}

- (void)setCookie_type:(unsigned __int8)a3
{
  self->_cookie_type = a3;
}

- (unsigned)cookie
{
  return self->_cookie;
}

- (void)setCookie:(unsigned __int16)a3
{
  self->_cookie = a3;
}

- (signed)mesaTemperature
{
  return self->_mesaTemperature;
}

- (void)setMesaTemperature:(signed __int16)a3
{
  self->_mesaTemperature = a3;
}

- (unsigned)mesaFd
{
  return self->_mesaFd;
}

- (void)setMesaFd:(unsigned __int8)a3
{
  self->_mesaFd = a3;
}

- (unsigned)mesaFdStuck
{
  return self->_mesaFdStuck;
}

- (void)setMesaFdStuck:(unsigned __int8)a3
{
  self->_mesaFdStuck = a3;
}

- (float)mesaTemperatureProcessed
{
  return self->_mesaTemperatureProcessed;
}

- (void)setMesaTemperatureProcessed:(float)a3
{
  self->_mesaTemperatureProcessed = a3;
}

@end
