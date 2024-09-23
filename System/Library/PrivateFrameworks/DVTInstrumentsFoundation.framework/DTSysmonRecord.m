@implementation DTSysmonRecord

- (unsigned)recordType
{
  return self->_recordType;
}

- (void)setRecordType:(unsigned int)a3
{
  self->_recordType = a3;
}

- (unint64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setStartTimestamp:(unint64_t)a3
{
  self->_startTimestamp = a3;
}

- (unint64_t)endTimestamp
{
  return self->_endTimestamp;
}

- (void)setEndTimestamp:(unint64_t)a3
{
  self->_endTimestamp = a3;
}

- (NSArray)changedProcesses
{
  return self->_changedProcesses;
}

- (void)setChangedProcesses:(id)a3
{
  objc_storeStrong((id *)&self->_changedProcesses, a3);
}

- (NSArray)deadProcesses
{
  return self->_deadProcesses;
}

- (void)setDeadProcesses:(id)a3
{
  objc_storeStrong((id *)&self->_deadProcesses, a3);
}

- (DTSysmonSystemRecord)system
{
  return self->_system;
}

- (void)setSystem:(id)a3
{
  objc_storeStrong((id *)&self->_system, a3);
}

- (NSArray)coalitions
{
  return self->_coalitions;
}

- (void)setCoalitions:(id)a3
{
  objc_storeStrong((id *)&self->_coalitions, a3);
}

- (NSArray)deadCoalitions
{
  return self->_deadCoalitions;
}

- (void)setDeadCoalitions:(id)a3
{
  objc_storeStrong((id *)&self->_deadCoalitions, a3);
}

- (DTSysmonCPUUsageRecord)cpuUsage
{
  return self->_cpuUsage;
}

- (void)setCpuUsage:(id)a3
{
  objc_storeStrong((id *)&self->_cpuUsage, a3);
}

- (NSArray)processAttributes
{
  return self->_processAttributes;
}

- (void)setProcessAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_processAttributes, a3);
}

- (NSArray)systemAttributes
{
  return self->_systemAttributes;
}

- (void)setSystemAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_systemAttributes, a3);
}

- (NSArray)coalitionAttributes
{
  return self->_coalitionAttributes;
}

- (void)setCoalitionAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_coalitionAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalitionAttributes, 0);
  objc_storeStrong((id *)&self->_systemAttributes, 0);
  objc_storeStrong((id *)&self->_processAttributes, 0);
  objc_storeStrong((id *)&self->_cpuUsage, 0);
  objc_storeStrong((id *)&self->_deadCoalitions, 0);
  objc_storeStrong((id *)&self->_coalitions, 0);
  objc_storeStrong((id *)&self->_system, 0);
  objc_storeStrong((id *)&self->_deadProcesses, 0);
  objc_storeStrong((id *)&self->_changedProcesses, 0);
}

@end
