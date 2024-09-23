@implementation DTActivityTraceTapLocalShuttle

- (void)executeStopOnItinerary:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  DTOSLogLoader *loaderStop;
  void *v8;
  void *v9;
  DTOSLogLoader *v10;
  const __CFString *v11;
  uint64_t v12;
  id commonFetchTicket;
  void *v14;
  id v15;
  objc_super v16;
  objc_super v17;

  v4 = a3;
  -[XRMobileAgent mode](self, "mode");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == (__CFString *)*MEMORY[0x24BE2A9D0])
  {
    v17.receiver = self;
    v17.super_class = (Class)DTActivityTraceTapLocalShuttle;
    -[XRMobileAgent executeStopOnItinerary:](&v17, sel_executeStopOnItinerary_, v4);
    self->_didPrepare = 0;
    loaderStop = self->_loaderStop;
    -[DTActivityTraceTapLocalShuttle configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DTOSLogLoader ticketToPrepare:configuration:](loaderStop, "ticketToPrepare:configuration:", self, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = self->_loaderStop;
    v11 = CFSTR("Preparing Stream");
LABEL_9:
    objc_msgSend(v4, "setNextStop:mode:ticket:", v10, v11, v9);

    goto LABEL_23;
  }
  if (v5 == CFSTR("Preparing Stream"))
  {
    self->_didPrepare = 1;
    self->_didStart = 0;
    goto LABEL_22;
  }
  if (v5 == CFSTR("Starting Stream"))
  {
    v12 = 51;
    goto LABEL_21;
  }
  if (v5 != CFSTR("Waiting"))
  {
    if (v5 != CFSTR("Stopping Stream"))
    {
      if (v5 != CFSTR("Fetching"))
      {
        v16.receiver = self;
        v16.super_class = (Class)DTActivityTraceTapLocalShuttle;
        -[XRMobileAgent executeStopOnItinerary:](&v16, sel_executeStopOnItinerary_, v4);
        goto LABEL_23;
      }
LABEL_22:
      objc_msgSend(v4, "setNextStop:mode:", self->_ownersDock, CFSTR("Waiting"));
      goto LABEL_23;
    }
    v12 = 53;
LABEL_21:
    *((_BYTE *)&self->super.super.isa + v12) = 1;
    goto LABEL_22;
  }
  if (self->_shouldStart && !self->_didStart)
  {
    -[DTOSLogLoader ticketToStartStream:](self->_loaderStop, "ticketToStartStream:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_loaderStop;
    v11 = CFSTR("Starting Stream");
    goto LABEL_9;
  }
  if (self->_shouldStop && !self->_didStop)
  {
    -[DTOSLogLoader ticketToStopStream:](self->_loaderStop, "ticketToStopStream:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_loaderStop;
    v11 = CFSTR("Stopping Stream");
    goto LABEL_9;
  }
  if (self->_shouldFetch)
  {
    commonFetchTicket = self->_commonFetchTicket;
    if (!commonFetchTicket)
    {
      -[DTOSLogLoader ticketToFetchData:window:](self->_loaderStop, "ticketToFetchData:window:", self, self->_fetchWindow);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = self->_commonFetchTicket;
      self->_commonFetchTicket = v14;

      commonFetchTicket = self->_commonFetchTicket;
    }
    objc_msgSend(v4, "setNextStop:mode:ticket:", self->_loaderStop, CFSTR("Fetching"), commonFetchTicket);
  }
  else
  {
    objc_msgSend(v4, "revisit");
  }
LABEL_23:

}

- (void)addPidToExecEntriesFromMapping:(id)a3
{
  _QWORD v3[5];

  if (self->_processDetectionCallback)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = sub_222B643C4;
    v3[3] = &unk_24EB29EC8;
    v3[4] = self;
    objc_msgSend(a3, "enumerateObjectsAndIntegerKeys:", v3);
  }
}

- (NSData)nextOutputBytes
{
  return self->nextOutputBytes;
}

- (void)setNextOutputBytes:(id)a3
{
  objc_storeStrong((id *)&self->nextOutputBytes, a3);
}

- (BOOL)isFetchComplete
{
  return self->fetchComplete;
}

- (void)setFetchComplete:(BOOL)a3
{
  self->fetchComplete = a3;
}

- (unint64_t)lastMachContinuousTime
{
  return self->lastMachContinuousTime;
}

- (void)setLastMachContinuousTime:(unint64_t)a3
{
  self->lastMachContinuousTime = a3;
}

- (unsigned)lostEventsSinceLastVisit
{
  return self->lostEventsSinceLastVisit;
}

- (void)setLostEventsSinceLastVisit:(unsigned int)a3
{
  self->lostEventsSinceLastVisit = a3;
}

- (NSError)failureReason
{
  return self->failureReason;
}

- (void)setFailureReason:(id)a3
{
  objc_storeStrong((id *)&self->failureReason, a3);
}

- (BOOL)didPrepare
{
  return self->_didPrepare;
}

- (void)setDidPrepare:(BOOL)a3
{
  self->_didPrepare = a3;
}

- (BOOL)shouldStart
{
  return self->_shouldStart;
}

- (void)setShouldStart:(BOOL)a3
{
  self->_shouldStart = a3;
}

- (BOOL)didStart
{
  return self->_didStart;
}

- (void)setDidStart:(BOOL)a3
{
  self->_didStart = a3;
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (BOOL)didStop
{
  return self->_didStop;
}

- (void)setDidStop:(BOOL)a3
{
  self->_didStop = a3;
}

- (BOOL)shouldFetch
{
  return self->_shouldFetch;
}

- (void)setShouldFetch:(BOOL)a3
{
  self->_shouldFetch = a3;
}

- (DTOSLogLoaderConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (id)processDetectionCallback
{
  return self->_processDetectionCallback;
}

- (void)setProcessDetectionCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (double)fetchWindow
{
  return self->_fetchWindow;
}

- (void)setFetchWindow:(double)a3
{
  self->_fetchWindow = a3;
}

- (DTOSLogLoader)loaderStop
{
  return self->_loaderStop;
}

- (void)setLoaderStop:(id)a3
{
  objc_storeStrong((id *)&self->_loaderStop, a3);
}

- (XRMobileAgentDock)ownersDock
{
  return self->_ownersDock;
}

- (void)setOwnersDock:(id)a3
{
  objc_storeStrong((id *)&self->_ownersDock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownersDock, 0);
  objc_storeStrong((id *)&self->_loaderStop, 0);
  objc_storeStrong(&self->_processDetectionCallback, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->failureReason, 0);
  objc_storeStrong((id *)&self->nextOutputBytes, 0);
  objc_storeStrong(&self->_commonFetchTicket, 0);
}

@end
