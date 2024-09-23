@implementation SSHBPresenceController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  void *v5;
  Turtle *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  id v27;
  uint8_t buf[16];

  -[SSHBPresenceController setInputs:](self, "setInputs:", a3, a4);
  -[SSHBPresenceController setStatusCodeSet:](self, "setStatusCodeSet:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[SSHBPresenceController setTurtleData:](self, "setTurtleData:", v5);

  v6 = objc_alloc_init(Turtle);
  -[SSHBPresenceController setTurtle:](self, "setTurtle:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBPresenceController turtle](self, "turtle"));
  objc_msgSend(v7, "setDelegate:", self);

  CFRunLoopRunInMode(kCFRunLoopDefaultMode, 2.0, 1u);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBPresenceController inputs](self, "inputs"));
  v9 = objc_msgSend(v8, "frequentSampling");

  if (v9)
  {
    v10 = DiagnosticLogHandleForCategory(3);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Enabling frequent sampling...", buf, 2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBPresenceController turtle](self, "turtle"));
    v27 = 0;
    v13 = objc_msgSend(v12, "configureFrequentBackgroundScan:error:", 1, &v27);
    v14 = v27;

    if ((v13 & 1) == 0)
    {
      v15 = DiagnosticLogHandleForCategory(3);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_100006FD4();

      -[SSHBPresenceController setStatusCode:](self, "setStatusCode:", 1);
    }
  }
  else
  {
    v14 = 0;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBPresenceController inputs](self, "inputs"));
  v18 = objc_msgSend(v17, "disableGapSubtraction");

  if (v18)
  {
    v19 = DiagnosticLogHandleForCategory(3);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Disabling gap subtraction...", buf, 2u);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBPresenceController turtle](self, "turtle"));
    v26 = v14;
    v22 = objc_msgSend(v21, "gapSubtraction:error:", 0, &v26);
    v23 = v26;

    if ((v22 & 1) == 0)
    {
      v24 = DiagnosticLogHandleForCategory(3);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_100006F74();

      -[SSHBPresenceController setStatusCode:](self, "setStatusCode:", 2);
    }
  }
  else
  {
    v23 = v14;
  }
  if (-[SSHBPresenceController statusCodeSet](self, "statusCodeSet"))
    -[SSHBPresenceController setFinished:](self, "setFinished:", 1);

}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  int v11;
  void *v12;
  float v13;
  signed int v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBPresenceController turtle](self, "turtle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBPresenceController inputs](self, "inputs"));
  objc_msgSend(v4, "sampleDuration");
  objc_msgSend(v3, "waitForDuration:");

  if (!-[SSHBPresenceController statusCodeSet](self, "statusCodeSet"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBPresenceController inputs](self, "inputs"));
    v6 = objc_msgSend(v5, "frequentSampling");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBPresenceController inputs](self, "inputs"));
    objc_msgSend(v7, "sampleDuration");
    v9 = v8;

    v10 = 50.0;
    if (!v6)
      v10 = 2.0;
    v11 = llround(v9 * v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBPresenceController inputs](self, "inputs"));
    objc_msgSend(v12, "acceptedDeviation");
    v14 = vcvtms_s32_f32((float)v11 - (float)((float)v11 * v13));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBPresenceController turtleData](self, "turtleData"));
    v16 = objc_msgSend(v15, "count");

    v17 = DiagnosticLogHandleForCategory(3);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if ((unint64_t)v16 >= v14)
    {
      if (v19)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBPresenceController turtleData](self, "turtleData"));
        v29 = 134217984;
        v30 = objc_msgSend(v22, "count");
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "SSHB found. (%lu)", (uint8_t *)&v29, 0xCu);

      }
      v21 = 0;
    }
    else
    {
      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBPresenceController turtleData](self, "turtleData"));
        v29 = 134217984;
        v30 = objc_msgSend(v20, "count");
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "SSHB NOT found, or insufficient number of samples. (%lu)", (uint8_t *)&v29, 0xCu);

      }
      v21 = 900;
    }

    -[SSHBPresenceController setStatusCode:](self, "setStatusCode:", v21);
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBPresenceController turtle](self, "turtle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "criticalErrors:", 0));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", v24, CFSTR("criticalErrors")));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBPresenceController inputs](self, "inputs"));
  LODWORD(v24) = objc_msgSend(v26, "sendRawData");

  if ((_DWORD)v24)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBPresenceController turtleData](self, "turtleData"));
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v27, CFSTR("rawData"));

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBPresenceController result](self, "result"));
  objc_msgSend(v28, "setData:", v25);

  -[SSHBPresenceController setFinished:](self, "setFinished:", 1);
}

- (void)teardown
{
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  id v23;
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBPresenceController turtle](self, "turtle"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBPresenceController inputs](self, "inputs"));
    v5 = objc_msgSend(v4, "frequentSampling");

    if (v5)
    {
      v6 = DiagnosticLogHandleForCategory(3);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Re-disabling frequent sampling...", buf, 2u);
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBPresenceController turtle](self, "turtle"));
      v23 = 0;
      v9 = objc_msgSend(v8, "configureFrequentBackgroundScan:error:", 0, &v23);
      v10 = v23;

      if ((v9 & 1) == 0)
      {
        v11 = DiagnosticLogHandleForCategory(3);
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          sub_100007094();

      }
    }
    else
    {
      v10 = 0;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBPresenceController inputs](self, "inputs"));
    v14 = objc_msgSend(v13, "disableGapSubtraction");

    if (v14)
    {
      v15 = DiagnosticLogHandleForCategory(3);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Re-enabling gap subtraction...", buf, 2u);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBPresenceController turtle](self, "turtle"));
      v22 = v10;
      v18 = objc_msgSend(v17, "gapSubtraction:error:", 1, &v22);
      v19 = v22;

      if ((v18 & 1) == 0)
      {
        v20 = DiagnosticLogHandleForCategory(3);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_100007034();

      }
    }
    else
    {
      v19 = v10;
    }
    -[SSHBPresenceController setTurtle:](self, "setTurtle:", 0);

  }
}

- (void)setStatusCode:(int64_t)a3
{
  void *v5;
  id v6;

  if (!-[SSHBPresenceController statusCodeSet](self, "statusCodeSet"))
  {
    -[SSHBPresenceController setStatusCodeSet:](self, "setStatusCodeSet:", 1);
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBPresenceController result](self, "result"));
    objc_msgSend(v5, "setStatusCode:", v6);

  }
}

- (void)turtleWasDisconnected
{
  uint64_t v3;
  NSObject *v4;

  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_1000070F4(v4);

  -[SSHBPresenceController setStatusCode:](self, "setStatusCode:", 3);
}

- (void)turtleCallback:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;

  v4 = a3;
  v5 = -[SSHBPresenceController isCancelled](self, "isCancelled");
  if (v4 && (v5 & 1) == 0)
  {
    objc_msgSend(v4, "capValue");
    objc_msgSend(v4, "gapValue");
    objc_msgSend(v4, "forceValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBPresenceController turtleData](self, "turtleData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "descriptionDictionary"));
    objc_msgSend(v6, "addObject:", v7);

    v8 = DiagnosticLogHandleForCategory(3);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_100007134(v4, v9);

  }
}

- (Turtle)turtle
{
  return self->_turtle;
}

- (void)setTurtle:(id)a3
{
  objc_storeStrong((id *)&self->_turtle, a3);
}

- (NSMutableArray)turtleData
{
  return self->_turtleData;
}

- (void)setTurtleData:(id)a3
{
  objc_storeStrong((id *)&self->_turtleData, a3);
}

- (BOOL)statusCodeSet
{
  return self->_statusCodeSet;
}

- (void)setStatusCodeSet:(BOOL)a3
{
  self->_statusCodeSet = a3;
}

- (SSHBPresenceInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_turtleData, 0);
  objc_storeStrong((id *)&self->_turtle, 0);
}

@end
