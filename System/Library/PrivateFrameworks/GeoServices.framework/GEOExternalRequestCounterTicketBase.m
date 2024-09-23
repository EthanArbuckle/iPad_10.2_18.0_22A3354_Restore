@implementation GEOExternalRequestCounterTicketBase

+ (id)externalRequestCounterForType:(id)a3 subtype:(id)a4 source:(id)a5 appId:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init((Class)a1);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    v16 = (void *)v14[1];
    v14[1] = v15;

    v17 = objc_msgSend(v11, "copy");
    v18 = (void *)v14[2];
    v14[2] = v17;

    v19 = objc_msgSend(v12, "copy");
    v20 = (void *)v14[3];
    v14[3] = v19;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v14[4];
    v14[4] = v21;

    v23 = objc_msgSend(v13, "copy");
    v24 = (void *)v14[5];
    v14[5] = v23;

  }
  return v14;
}

- (void)_incrementExternalForApp:(id)a3 startTime:(id)a4 endTime:(id)a5 xmitBytes:(int64_t)a6 recvBytes:(int64_t)a7 usedInterfaces:(unint64_t)a8 requestType:(id)a9 requestSubtype:(id)a10 source:(id)a11
{
  -[GEOExternalRequestCounterTicketBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6, a7, a8);
}

- (void)requestCompletedWithAMPResult:(id)a3
{
  NSString *appId;
  NSDate *startDate;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  startDate = self->_startDate;
  appId = self->_appId;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOExternalRequestCounterTicketBase _incrementExternalForApp:startTime:endTime:xmitBytes:recvBytes:usedInterfaces:requestType:requestSubtype:source:](self, "_incrementExternalForApp:startTime:endTime:xmitBytes:recvBytes:usedInterfaces:requestType:requestSubtype:source:", appId, startDate, v6, 0, objc_msgSend(v7, "length"), 0, self->_requestType, self->_requestSubtype, self->_source);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appId, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_requestSubtype, 0);
  objc_storeStrong((id *)&self->_requestType, 0);
}

@end
