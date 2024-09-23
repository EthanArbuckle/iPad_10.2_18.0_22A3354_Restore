void sub_100003B48(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "aggregator"));
  objc_msgSend(v1, "beginAggregation");

}

id objc_msgSend_aggregator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aggregator");
}

id objc_msgSend_beginAggregation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginAggregation");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_getSynchronousResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSynchronousResult");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_setAggregator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAggregator:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}
