@implementation MPCPlaybackEngineEventStreamCursor

void __95___MPCPlaybackEngineEventStreamCursor__statementForColumnsExpression_eventTypes_payload_limit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v8 = a2;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("@payload_key_%d"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("@payload_value_%d"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bindStringValue:toParameterNamed:", v8, v9);

  if (_NSIsNSNumber())
  {
    objc_msgSend(*(id *)(a1 + 32), "bindInt64Value:toParameterNamed:", objc_msgSend(v5, "longLongValue"), v10);
  }
  else if (_NSIsNSString())
  {
    objc_msgSend(*(id *)(a1 + 32), "bindStringValue:toParameterNamed:", v5, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11 == v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "bindNullValueToParameterNamed:", v10);
    }
    else if (_NSIsNSArray())
    {
      v12 = *(void **)(a1 + 32);
      v17 = 0;
      objc_msgSend(v12, "bindJSONValue:toParameterNamed:error:", v5, v10, &v17);
      v13 = v17;
      if (v13)
      {
        v16 = v13;
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("MPCPlaybackEngineEventStream.m"), 1168, CFSTR("Unable to convert payload value to JSON: %@"), v5);

        v13 = v16;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("MPCPlaybackEngineEventStream.m"), 1170, CFSTR("Unknown payload value type for query: %@"), v5);

    }
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

}

@end
