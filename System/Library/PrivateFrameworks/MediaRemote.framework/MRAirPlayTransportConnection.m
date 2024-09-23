@implementation MRAirPlayTransportConnection

- (id)_init
{
  MRAirPlayTransportConnection *v2;
  uint64_t v3;
  NSDate *dateCreated;
  MROSTransaction *v5;
  void *v6;
  uint64_t v7;
  MROSTransaction *transaction;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MRAirPlayTransportConnection;
  v2 = -[MRAirPlayTransportConnection init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v3 = objc_claimAutoreleasedReturnValue();
    dateCreated = v2->_dateCreated;
    v2->_dateCreated = (NSDate *)v3;

    v5 = [MROSTransaction alloc];
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.mediaremote.%@.%p"), objc_opt_class(), v2);
    v7 = -[MROSTransaction initWithName:](v5, "initWithName:", v6);
    transaction = v2->_transaction;
    v2->_transaction = (MROSTransaction *)v7;

    MRRegisterTransaction(v2->_transaction);
  }
  return v2;
}

- (MRAirPlayTransportConnection)initWithAPCommunicationChannel:(id)a3
{
  id v5;
  id *v6;
  MRAirPlayTransportConnection *v7;
  NSObject *v8;
  int v10;
  MRAirPlayTransportConnection *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[MRAirPlayTransportConnection _init](self, "_init");
  v7 = (MRAirPlayTransportConnection *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 8, a3);
    MRLogCategoryConnections();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "[MRAirPlayTransportConnection] Creating new connection with APChannel %@", (uint8_t *)&v10, 0xCu);
    }

  }
  return v7;
}

- (MRAirPlayTransportConnection)initWithOutputContextCommunicationChannel:(id)a3 outputContext:(id)a4
{
  id v7;
  id v8;
  id *v9;
  MRAirPlayTransportConnection *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  MRAirPlayTransportConnection *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = -[MRAirPlayTransportConnection _init](self, "_init");
  v10 = (MRAirPlayTransportConnection *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 9, a3);
    objc_msgSend(v8, "outputDevices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "ID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRExternalDeviceTransportConnection setDestinationOutputDeviceUID:](v10, "setDestinationOutputDeviceUID:", v13);

    MRLogCategoryConnections();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543874;
      v17 = v8;
      v18 = 2114;
      v19 = v12;
      v20 = 2114;
      v21 = v10;
      _os_log_impl(&dword_193827000, v14, OS_LOG_TYPE_DEFAULT, "[MRAirPlayTransportConnection] Creating new connection with outputContext %{public}@ with pilotOutputDevice <%{public}@> with outputContextChannel %{public}@", (uint8_t *)&v16, 0x20u);
    }

  }
  return v10;
}

- (MRAirPlayTransportConnection)initWithOutputDeviceCommunicationChannel:(id)a3
{
  id v5;
  id *v6;
  MRAirPlayTransportConnection *v7;
  NSObject *v8;
  int v10;
  MRAirPlayTransportConnection *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[MRAirPlayTransportConnection _init](self, "_init");
  v7 = (MRAirPlayTransportConnection *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 10, a3);
    -[AVOutputDeviceCommunicationChannel setDelegate:](v7->_outputDeviceCommunicationChannel, "setDelegate:", v7);
    MRLogCategoryConnections();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v7;
      _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "[MRAirPlayTransportConnection] Creating new connection with OutputDeviceChannel %{public}@", (uint8_t *)&v10, 0xCu);
    }

  }
  return v7;
}

- (NSString)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRAirPlayTransportConnection effectiveChannel](self, "effectiveChannel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%p %@>\n"), v4, self, v5);

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  MRAirPlayTransportConnection *v2;
  id v3;
  uint64_t v4;
  void *v5;
  NSDate *dateCreated;
  double v7;
  double v8;
  NSDate *mostRecentMessageSentDate;
  double v10;
  double v11;
  unint64_t totalMessagesSentCount;
  unint64_t totalBytesSentCount;
  NSDate *mostRecentMessageReceivedDate;
  double v15;
  void *v16;

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRAirPlayTransportConnection effectiveChannel](v2, "effectiveChannel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dateCreated = v2->_dateCreated;
  -[NSDate timeIntervalSinceNow](dateCreated, "timeIntervalSinceNow");
  v8 = v7;
  mostRecentMessageSentDate = v2->_mostRecentMessageSentDate;
  -[NSDate timeIntervalSinceNow](mostRecentMessageSentDate, "timeIntervalSinceNow");
  v11 = v10;
  totalMessagesSentCount = v2->_totalMessagesSentCount;
  totalBytesSentCount = v2->_totalBytesSentCount;
  mostRecentMessageReceivedDate = v2->_mostRecentMessageReceivedDate;
  -[NSDate timeIntervalSinceNow](mostRecentMessageReceivedDate, "timeIntervalSinceNow");
  v16 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%p {\n  communicationChannel = %@\n  dateCreated = %@ (%lf seconds ago)\n  mostRecentMessageSentDate = %@ (%lf seconds ago)\n  totalMessagesSent = %lu\n  totalBytesSent = %lu\n  mostRecentMessageReceivedDate = %@ (%lf seconds ago)\n  totalMessagesReceived = %lu\n  totalBytesReceived = %lu\n}>"), v4, v2, v5, dateCreated, -v8, mostRecentMessageSentDate, -v11, totalMessagesSentCount, totalBytesSentCount, mostRecentMessageReceivedDate, -v15, v2->_totalMessagesReceivedCount, v2->_totalBytesReceivedCount);

  objc_sync_exit(v2);
  return (NSString *)v16;
}

- (void)ingestData:(id)a3
{
  id v4;
  NSObject *v5;
  MRAirPlayTransportConnection *v6;
  uint64_t v7;
  NSDate *mostRecentMessageReceivedDate;
  int v9;
  id v10;
  __int16 v11;
  MRAirPlayTransportConnection *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MRLogCategoryConnections();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v4;
    v11 = 2114;
    v12 = self;
    _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[MRAirPlayTransportConnection] Connection received data %@ from %{public}@", (uint8_t *)&v9, 0x16u);
  }

  v6 = self;
  objc_sync_enter(v6);
  ++v6->_totalMessagesReceivedCount;
  v6->_totalBytesReceivedCount += objc_msgSend(v4, "length");
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = objc_claimAutoreleasedReturnValue();
  mostRecentMessageReceivedDate = v6->_mostRecentMessageReceivedDate;
  v6->_mostRecentMessageReceivedDate = (NSDate *)v7;

  objc_sync_exit(v6);
  -[MRExternalDeviceTransportConnection _notifyDelegateDidReceiveData:](v6, "_notifyDelegateDidReceiveData:", v4);

}

- (BOOL)isValid
{
  MRAirPlayTransportConnection *v2;
  void *v3;
  BOOL v4;

  v2 = self;
  objc_sync_enter(v2);
  -[MRAirPlayTransportConnection effectiveChannel](v2, "effectiveChannel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  objc_sync_exit(v2);
  return v4;
}

- (unint64_t)sendTransportData:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  MRAirPlayTransportConnection *v10;
  uint64_t v11;
  NSDate *mostRecentMessageSentDate;
  unint64_t v13;
  int v15;
  id v16;
  __int16 v17;
  MRAirPlayTransportConnection *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MRAirPlayTransportConnection effectiveChannel](self, "effectiveChannel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    MRLogCategoryConnections();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v6;
      v17 = 2114;
      v18 = self;
      _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "[MRAirPlayTransportConnection] Connection sent data %@ to %{public}@", (uint8_t *)&v15, 0x16u);
    }

    v10 = self;
    objc_sync_enter(v10);
    ++v10->_totalMessagesSentCount;
    v10->_totalBytesSentCount += objc_msgSend(v6, "length");
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = objc_claimAutoreleasedReturnValue();
    mostRecentMessageSentDate = v10->_mostRecentMessageSentDate;
    v10->_mostRecentMessageSentDate = (NSDate *)v11;

    objc_sync_exit(v10);
    v13 = -[MRAirPlayTransportConnection _sendTransportData:](v10, "_sendTransportData:", v6);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)_sendTransportData:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__MRAirPlayTransportConnection__sendTransportData___block_invoke;
  v8[3] = &unk_1E30C6918;
  v8[4] = self;
  v4 = a3;
  v5 = (void *)MEMORY[0x194036C44](v8);
  -[APReceiverMediaRemoteCommunicationChannel sendData:completionHandler:](self->_apCommunicationChannel, "sendData:completionHandler:", v4, v5);
  -[AVOutputContextCommunicationChannel sendData:completionHandler:](self->_outputContextCommunicationChannel, "sendData:completionHandler:", v4, v5);
  -[AVOutputDeviceCommunicationChannel sendData:completionHandler:](self->_outputDeviceCommunicationChannel, "sendData:completionHandler:", v4, v5);
  v6 = objc_msgSend(v4, "length");

  return v6;
}

void __51__MRAirPlayTransportConnection__sendTransportData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    MRLogCategoryConnections();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v3;
      v8 = 2114;
      v9 = v5;
      _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_ERROR, "[MRAirPlayTransportConnection] Connection error %@ sending data to %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
}

- (void)closeWithError:(id)a3
{
  MRAirPlayTransportConnection *v4;
  void *v5;
  MRSetConnectionStateMessage *v6;
  void *v7;
  void *v8;
  id v9;
  APReceiverMediaRemoteCommunicationChannel *apCommunicationChannel;
  AVOutputContextCommunicationChannel *outputContextCommunicationChannel;
  AVOutputDeviceCommunicationChannel *outputDeviceCommunicationChannel;
  id v13;

  v13 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MRAirPlayTransportConnection effectiveChannel](v4, "effectiveChannel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v4->_apCommunicationChannel)
    {
      v6 = -[MRSetConnectionStateMessage initWithConnectionState:]([MRSetConnectionStateMessage alloc], "initWithConnectionState:", 3);
      -[MRProtocolMessage setError:](v6, "setError:", v13);
      -[MRProtocolMessage protobufData](v6, "protobufData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D4D080], "createHeader:", objc_msgSend(v7, "length"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
      objc_msgSend(v9, "appendData:", v8);
      objc_msgSend(v9, "appendData:", v7);
      -[MRAirPlayTransportConnection _sendTransportData:](v4, "_sendTransportData:", v9);

    }
    v4->_channelClosed = 1;
    apCommunicationChannel = v4->_apCommunicationChannel;
    v4->_apCommunicationChannel = 0;

    outputContextCommunicationChannel = v4->_outputContextCommunicationChannel;
    v4->_outputContextCommunicationChannel = 0;

    -[AVOutputDeviceCommunicationChannel close](v4->_outputDeviceCommunicationChannel, "close");
    -[AVOutputDeviceCommunicationChannel setDelegate:](v4->_outputDeviceCommunicationChannel, "setDelegate:", 0);
    outputDeviceCommunicationChannel = v4->_outputDeviceCommunicationChannel;
    v4->_outputDeviceCommunicationChannel = 0;

    objc_sync_exit(v4);
    -[MRExternalDeviceTransportConnection _notifyDelegateDidCloseWithError:](v4, "_notifyDelegateDidCloseWithError:", v13);
  }
  else
  {
    objc_sync_exit(v4);

  }
}

- (void)communicationChannel:(id)a3 didReceiveData:(id)a4
{
  -[MRAirPlayTransportConnection ingestData:](self, "ingestData:", a4);
}

- (void)communicationChannelDidClose:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 105, CFSTR("AVOutputDeviceCommunicationChannel.communicationChannelDidClose"));
  -[MRAirPlayTransportConnection closeWithError:](self, "closeWithError:", v4);

}

- (id)effectiveChannel
{
  APReceiverMediaRemoteCommunicationChannel *apCommunicationChannel;

  apCommunicationChannel = self->_apCommunicationChannel;
  if (!apCommunicationChannel)
  {
    apCommunicationChannel = self->_outputContextCommunicationChannel;
    if (!apCommunicationChannel)
      apCommunicationChannel = self->_outputDeviceCommunicationChannel;
  }
  return apCommunicationChannel;
}

- (APReceiverMediaRemoteCommunicationChannel)apCommunicationChannel
{
  return self->_apCommunicationChannel;
}

- (AVOutputContextCommunicationChannel)outputContextCommunicationChannel
{
  return self->_outputContextCommunicationChannel;
}

- (AVOutputDeviceCommunicationChannel)outputDeviceCommunicationChannel
{
  return self->_outputDeviceCommunicationChannel;
}

- (BOOL)channelClosed
{
  return self->_channelClosed;
}

- (void)setChannelClosed:(BOOL)a3
{
  self->_channelClosed = a3;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
  objc_storeStrong((id *)&self->_dateCreated, a3);
}

- (NSDate)mostRecentMessageSentDate
{
  return self->_mostRecentMessageSentDate;
}

- (void)setMostRecentMessageSentDate:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentMessageSentDate, a3);
}

- (unint64_t)totalMessagesSentCount
{
  return self->_totalMessagesSentCount;
}

- (void)setTotalMessagesSentCount:(unint64_t)a3
{
  self->_totalMessagesSentCount = a3;
}

- (unint64_t)totalBytesSentCount
{
  return self->_totalBytesSentCount;
}

- (void)setTotalBytesSentCount:(unint64_t)a3
{
  self->_totalBytesSentCount = a3;
}

- (NSDate)mostRecentMessageReceivedDate
{
  return self->_mostRecentMessageReceivedDate;
}

- (void)setMostRecentMessageReceivedDate:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentMessageReceivedDate, a3);
}

- (unint64_t)totalMessagesReceivedCount
{
  return self->_totalMessagesReceivedCount;
}

- (void)setTotalMessagesReceivedCount:(unint64_t)a3
{
  self->_totalMessagesReceivedCount = a3;
}

- (unint64_t)totalBytesReceivedCount
{
  return self->_totalBytesReceivedCount;
}

- (void)setTotalBytesReceivedCount:(unint64_t)a3
{
  self->_totalBytesReceivedCount = a3;
}

- (MROSTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_mostRecentMessageReceivedDate, 0);
  objc_storeStrong((id *)&self->_mostRecentMessageSentDate, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_outputDeviceCommunicationChannel, 0);
  objc_storeStrong((id *)&self->_outputContextCommunicationChannel, 0);
  objc_storeStrong((id *)&self->_apCommunicationChannel, 0);
}

@end
