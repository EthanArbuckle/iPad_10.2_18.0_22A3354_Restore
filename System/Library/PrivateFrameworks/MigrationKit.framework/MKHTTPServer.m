@implementation MKHTTPServer

- (MKHTTPServer)init
{
  MKHTTPServer *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *requests;
  MKHTTPParser *v5;
  MKHTTPParser *parser;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MKHTTPServer;
  v2 = -[MKHTTPRequestMultiplexer init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    requests = v2->_requests;
    v2->_requests = v3;

    v5 = objc_alloc_init(MKHTTPParser);
    parser = v2->_parser;
    v2->_parser = v5;

  }
  return v2;
}

- (void)run
{
  MKListener *v3;
  MKListener *listener;

  v3 = objc_alloc_init(MKListener);
  listener = self->_listener;
  self->_listener = v3;

  -[MKListener setDelegate:](self->_listener, "setDelegate:", self);
  -[MKListener setPort:](self->_listener, "setPort:", self->_port);
  -[MKListener setCertificate:](self->_listener, "setCertificate:", self->_certificate);
  -[MKListener setClientCertificate:](self->_listener, "setClientCertificate:", self->_clientCertificate);
  -[MKListener setUseTLS:](self->_listener, "setUseTLS:", self->_useHTTPS);
  -[MKListener setService:](self->_listener, "setService:", self->_service);
  -[MKListener listen](self->_listener, "listen");
}

- (void)cancel
{
  -[MKListener cancel](self->_listener, "cancel");
}

- (void)listener:(id)a3 didOpen:(int64_t)a4
{
  id WeakRetained;

  -[MKHTTPServer setPort:](self, "setPort:", a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "server:didOpen:", self, a4);

}

- (void)listenerDidCancel:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "serverDidCancel:", self);

}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *requests;
  void *v10;
  void *v11;
  void *v12;
  MKHTTPParser *parser;
  void *v14;
  uint64_t v15;
  void *v16;
  MKHTTPResponse *v17;
  unsigned int v18;
  unint64_t v19;
  char v20;
  char v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  MKHTTPParser *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  NSMutableDictionary *v36;
  NSMutableDictionary *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  MKListener *listener;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  unsigned int v51;
  MKTime *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  unsigned __int8 v61;
  uint64_t v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v52 = objc_alloc_init(MKTime);
  v8 = self->_requests;
  objc_sync_enter(v8);
  requests = self->_requests;
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](requests, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v8);
  if (v11)
  {
    objc_msgSend(v11, "appendData:", v7);
    v12 = v11;
  }
  else
  {
    parser = self->_parser;
    objc_msgSend(v6, "hostname");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKHTTPParser parse:hostname:](parser, "parse:hostname:", v7, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v15;
  }
  v56 = v12;
  objc_msgSend(v12, "headers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MKHTTPResponse);
  objc_msgSend(v16, "method");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "path");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "body");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v7;
  v51 = objc_msgSend(v16, "isClosed");
  v18 = objc_msgSend(v16, "contentLength");
  v19 = objc_msgSend(v55, "length");
  v20 = objc_msgSend(v16, "transferEncoding");
  v21 = v20;
  if (v19 >= v18 && (v20 & 1) == 0)
    goto LABEL_6;
  if (!v11)
  {
    v36 = self->_requests;
    objc_sync_enter(v36);
    v37 = self->_requests;
    v49 = v6;
    objc_msgSend(v6, "identifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v37, "setObject:forKey:", v56, v38);

    objc_sync_exit(v36);
    v6 = v49;
  }
  if (v19 < v18)
  {
    -[MKListener readData:](self->_listener, "readData:", v6);
    v25 = v50;
    goto LABEL_21;
  }
  if ((v21 & 1) == 0)
    goto LABEL_6;
  v62 = 0;
  v61 = 0;
  -[MKHTTPParser chunk:offset:done:](self->_parser, "chunk:offset:done:", v55, &v62, &v61);
  v25 = v50;
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setChunkedTransferCompleted:", v61);
  objc_msgSend(v56, "chunk");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setChunkOffset:", objc_msgSend(v56, "chunkOffset") + objc_msgSend(v47, "length"));

  objc_msgSend(v56, "setChunk:", v46);
  if (v62)
    objc_msgSend(v56, "sliceData:");
  if (v61)
  {

LABEL_6:
    v22 = self->_requests;
    objc_sync_enter(v22);
    v23 = self->_requests;
    objc_msgSend(v6, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v23, "removeObjectForKey:", v24);

    v25 = v50;
    objc_sync_exit(v22);

    -[MKHTTPResponse headers](v17, "headers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "close:", v51);

    -[MKHTTPRequestMultiplexer routerForMethod:path:](self, "routerForMethod:path:", v54, v53);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "boundary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v23) = v28 == 0;

    if ((_DWORD)v23)
    {
      objc_msgSend(v27, "server:didReceiveRequest:response:", self, v56, v17);
    }
    else
    {
      v29 = self->_parser;
      objc_msgSend(v16, "boundary");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKHTTPParser parts:boundary:container:](v29, "parts:boundary:container:", v55, v30, v56);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v32 = v31;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
      if (v33)
      {
        v34 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v58 != v34)
              objc_enumerationMutation(v32);
            objc_msgSend(v27, "server:didReceiveRequest:response:", self, *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i), v17);
          }
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
        }
        while (v33);
      }

    }
    -[MKHTTPResponse headers](v17, "headers");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "serverTiming");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTime elapsedTimeInSeconds](v52, "elapsedTimeInSeconds");
    v42 = v41;
    objc_msgSend(v40, "response");
    objc_msgSend(v40, "setResponse:", v42 + v43);

    listener = self->_listener;
    -[MKHTTPResponse responseData](v17, "responseData");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKListener sendData:throughConnection:close:](listener, "sendData:throughConnection:close:", v45, v6, v51);

    goto LABEL_21;
  }
  if (objc_msgSend(v46, "length"))
  {
    -[MKHTTPRequestMultiplexer routerForMethod:path:](self, "routerForMethod:path:", v54, v53);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "server:didReceiveRequest:response:", self, v56, v17);

  }
  -[MKListener readData:](self->_listener, "readData:", v6);

LABEL_21:
}

- (MKHTTPServerDelegate)delegate
{
  return (MKHTTPServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)useHTTPS
{
  return self->_useHTTPS;
}

- (void)setUseHTTPS:(BOOL)a3
{
  self->_useHTTPS = a3;
}

- (unint64_t)port
{
  return self->_port;
}

- (void)setPort:(unint64_t)a3
{
  self->_port = a3;
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (MKCertificate)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(id)a3
{
  objc_storeStrong((id *)&self->_certificate, a3);
}

- (MKCertificate)clientCertificate
{
  return self->_clientCertificate;
}

- (void)setClientCertificate:(id)a3
{
  objc_storeStrong((id *)&self->_clientCertificate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientCertificate, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
