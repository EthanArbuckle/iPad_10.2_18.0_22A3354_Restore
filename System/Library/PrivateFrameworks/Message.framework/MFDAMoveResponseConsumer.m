@implementation MFDAMoveResponseConsumer

- (MFDAMoveResponseConsumer)initWithSourceRemoteIDs:(id)a3 destinationRemoteIDsBySourceRemoteIDs:(id)a4 failures:(id)a5
{
  id v9;
  id v10;
  id v11;
  MFDAMoveResponseConsumer *v12;
  MFDAMoveResponseConsumer *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MFDAMoveResponseConsumer;
  v12 = -[MFDAMailAccountConsumer init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sourceRemoteIDs, a3);
    objc_storeStrong((id *)&v13->_destinationRemoteIDsBySourceRemoteIDs, a4);
    objc_storeStrong((id *)&v13->_failures, a5);
    v13->_statusCode = 2;
  }

  return v13;
}

- (void)taskFailed:(id)a3 statusCode:(int64_t)a4 error:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a5;
  self->_statusCode = a4;
  if (((a4 - 63) & 0xFFFFFFFFFFFFFFEFLL) != 0)
    v9 = 1030;
  else
    v9 = 1032;
  +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[NSMutableSet unionSet:](self->_failures, "unionSet:", self->_sourceRemoteIDs);
    -[MFDAMoveResponseConsumer setError:](self, "setError:", v10);
  }

}

- (void)resultsForMessageMove:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v16;
    *(_QWORD *)&v6 = 138543362;
    v14 = v6;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        objc_msgSend(v9, "sourceID", v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10 || !-[NSSet containsObject:](self->_sourceRemoteIDs, "containsObject:", v10))
        {
          DALoggingwithCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v20 = v9;
            v21 = 2112;
            v22 = v10;
            _os_log_impl(&dword_1A4F90000, v11, OS_LOG_TYPE_DEFAULT, "got %@ with untracked sourceID \"%@\", buf, 0x16u);
          }
          goto LABEL_13;
        }
        if (objc_msgSend(v9, "status") == 3)
        {
          objc_msgSend(v9, "destID");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_destinationRemoteIDsBySourceRemoteIDs, "setObject:forKeyedSubscript:", v11, v10);
          }
          else
          {
            DALoggingwithCategory();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v14;
              v20 = v10;
              _os_log_impl(&dword_1A4F90000, v12, OS_LOG_TYPE_DEFAULT, "Move succeeded but missing new remote ID for message ID: %{public}@", buf, 0xCu);
            }

          }
LABEL_13:

          goto LABEL_14;
        }
        -[NSMutableSet addObject:](self->_failures, "addObject:", v10);
LABEL_14:

        ++v8;
      }
      while (v5 != v8);
      v13 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      v5 = v13;
    }
    while (v13);
  }

  -[MFDAMailAccountConsumer setDone:](self, "setDone:", 1);
}

- (MFError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_failures, 0);
  objc_storeStrong((id *)&self->_destinationRemoteIDsBySourceRemoteIDs, 0);
  objc_storeStrong((id *)&self->_sourceRemoteIDs, 0);
}

@end
