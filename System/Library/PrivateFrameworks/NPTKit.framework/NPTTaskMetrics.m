@implementation NPTTaskMetrics

- (NPTTaskMetrics)init
{
  NPTTaskMetrics *v2;
  NPTTaskMetrics *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NPTTaskMetrics;
  v2 = -[NPTTaskMetrics init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NPTTaskMetrics setTask:](v2, "setTask:", 0);
    -[NPTTaskMetrics setResults:](v3, "setResults:", 0);
    -[NPTTaskMetrics setTaskMetrics:](v3, "setTaskMetrics:", 0);
  }
  return v3;
}

- (NSURLSessionDataTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (NPTMetricResult)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (NSURLSessionTaskMetrics)taskMetrics
{
  return self->_taskMetrics;
}

- (void)setTaskMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_taskMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskMetrics, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

@end
